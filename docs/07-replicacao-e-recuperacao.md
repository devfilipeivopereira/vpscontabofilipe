# Replicação e Recuperação

## Objetivo

Deixar a VPS replicável mesmo se for necessário reprovisionar o host ou reconstruir os serviços em outra máquina.

Esta documentação agora trabalha em duas camadas:
- camada pública: inventário, runbooks e YAMLs sanitizadas versionadas no Git
- camada privada: kit bruto com compose files, banco do Portainer e snapshots operacionais fora do Git

## O que já está salvo

No repositório público:
- inventário detalhado da VPS
- documentação por serviço
- snapshots sanitizados das stacks persistidas no Portainer
- manifesto com serviços, volumes, redes, domínios e nomes de variáveis de ambiente esperadas

No kit privado:
- compose brutas extraídas de `portainer_data/_data/compose`
- `portainer.db`
- snapshots de `docker service inspect`
- snapshots do Swarm, volumes e rede `FilipeNet`
- regras dinâmicas do Traefik
- `ecosystem.config.cjs` do `slides`
- scripts de backup detectados
- kit amplo de backup via SSH com módulos restauráveis do host

## Convenção adotada

Nesta documentação, `PRIVATE_BACKUP_ROOT` representa:
- `C:\Users\filip\DEV\VPS\backups_privados`

Kit privado criado nesta coleta:
- diretório: `PRIVATE_BACKUP_ROOT/contabo/2026-04-21`
- arquivo consolidado: `PRIVATE_BACKUP_ROOT/contabo/contabo-recovery-kit-2026-04-21.zip`
- hash SHA-256: `ec1ba4f36ab29d5542cb1943d84cd0077296a8efc2b3f19368697ff93a6622dd`

Kit local de backup amplo via SSH:
- script de backup: `C:\Users\filip\DEV\VPS\backup\backup_vps_via_ssh.py`
- script de restore: `C:\Users\filip\DEV\VPS\backup\restore_vps_via_ssh.py`
- pasta expandida: `C:\Users\filip\DEV\VPS\backup\vps-backup-20260421-restore-kit`
- pacote zipado: `C:\Users\filip\DEV\VPS\backup\vps-backup-20260421-restore-kit.zip`
- hash SHA-256 atual do zip: `e084891c6ac181298e8b01977499bff96a5fe425066ebdbbc28370e0783f44d2`

## Ordem recomendada de restauração

1. Reprovisionar o host.
   O caminho mais fiel à VPS atual é repetir o perfil observado: KVM, `KDE neon User Edition 24.04`, kernel da família `6.8`, `4 vCPU`, cerca de `8 GiB` de RAM, swap configurada e disco compatível com os volumes atuais.

2. Reinstalar a base operacional.
   Garantir `docker`, `docker swarm`, `ufw`, `fail2ban`, `node`, `npm`, `pm2`, `python3` e SSH operacional.

3. Restaurar artefatos do host.
   Aplicar arquivos do kit privado conforme necessário:
   - `arquivos/traefik/*`
   - `arquivos/slides/ecosystem.config.cjs`
   - `arquivos/scripts/*`
   - `portainer/root-crontab.txt`

4. Recriar a camada Docker.
   Confirmar o Swarm em nó único e recriar a rede overlay principal:

```bash
docker swarm init
docker network create --driver overlay --attachable FilipeNet
```

5. Restaurar stacks do Portainer.
   Priorizar os YAMLs brutos do kit privado quando a meta for reprodução fiel.
   Usar as versões sanitizadas do repositório apenas como referência estrutural.

6. Restaurar dados.
   Reidratar volumes com:
   - backups em `/opt/backups`
   - scripts já detectados na VPS
   - snapshots ou dumps externos, se existirem

6.1. Alternativa operacional mais rápida.
   Quando a meta for trazer uma VPS nova para um estado muito próximo da atual, usar o kit local de backup amplo via SSH.
   Esse kit já inclui:
   - `etc.tar.gz`
   - `usr-local-bin.tar.gz`
   - `root.tar.gz`
   - `opt.tar.gz`
   - `var-www.tar.gz`
   - `docker-state.tar.gz`
   - `database-dumps.tar.gz`
   - `metadata.tar.gz`

6.2. Restore automatizado desse kit.
   O script local de restore opera em modo seguro por padrão e só aplica mudanças com `--apply`.

```powershell
python C:\Users\filip\DEV\VPS\backup\restore_vps_via_ssh.py `
  --kit C:\Users\filip\DEV\VPS\backup\vps-backup-20260421-restore-kit.zip `
  --host NOVA_VPS `
  --user root `
  --password "SENHA" `
  --apply
```

7. Revalidar endpoints.
   Conferir:
   - DNS
   - `80/443`
   - domínios do Traefik
   - portas diretas `3000`, `3001`, `8088`
   - health dos serviços Swarm

## O que ainda depende de fonte externa

Mesmo com o kit atual, uma replicação completa ainda depende de itens fora deste repositório:
- zona DNS e nameservers do domínio
- segredos de terceiros que precisem ser rotacionados
- dumps ou snapshots atualizados dos dados de aplicação
- qualquer configuração feita diretamente em painel externo

## Checklist de validação após restore

- `docker stack ls`
- `docker service ls`
- `ufw status verbose`
- `pm2 list`
- `curl -kI https://work.filipeivopereira.com`
- `curl -kI https://port.filipeivopereira.com`
- `curl -kI https://supabase.filipeivopereira.com`
- `curl -I http://127.0.0.1:3000`
- `curl -I http://127.0.0.1:3001`
- `curl -I http://127.0.0.1:8088`

## Rotina recomendada de atualização

Sempre que uma stack for alterada no Portainer:
- atualizar o kit privado
- regenerar as compose sanitizadas
- revisar divergências entre YAML salva e imagem realmente em execução
- fazer commit da parte pública no repositório

Sempre que houver mudança estrutural relevante na VPS:
- regenerar o backup amplo via SSH
- recalcular e registrar o hash do zip
- revisar se o script de restore continua compatível com o estado atual do host
- atualizar a documentação de recuperação
