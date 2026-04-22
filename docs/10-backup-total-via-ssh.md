# Backup Total via SSH

## Objetivo

Manter um kit local de backup amplo da VPS, orientado a restauração prática em outra máquina.

Esse kit não é imagem bruta de disco. Em vez disso, ele empacota as partes que mais importam para reproduzir o ambiente:
- configuração do host
- arquivos operacionais
- estado do Docker
- dumps de banco
- metadados de inventário

## Scripts locais

Os scripts operacionais foram mantidos fora deste repositório, em:
- `C:\Users\filip\DEV\VPS\backup\backup_vps_via_ssh.py`
- `C:\Users\filip\DEV\VPS\backup\restore_vps_via_ssh.py`

Motivo:
- eles manipulam credenciais de acesso da VPS
- o kit gerado é volumoso
- o objetivo aqui é documentar o fluxo, não versionar um binário de quase `8 GB`

## Kit gerado nesta coleta

Arquivos locais:
- pasta expandida: `C:\Users\filip\DEV\VPS\backup\vps-backup-20260421-restore-kit`
- pacote zipado: `C:\Users\filip\DEV\VPS\backup\vps-backup-20260421-restore-kit.zip`
- hash: `C:\Users\filip\DEV\VPS\backup\vps-backup-20260421-restore-kit.zip.sha256.txt`

Integridade atual:
- SHA-256 do zip: `e084891c6ac181298e8b01977499bff96a5fe425066ebdbbc28370e0783f44d2`

## Conteúdo do kit

Módulos empacotados:
- `metadata.tar.gz`
- `etc.tar.gz`
- `usr-local-bin.tar.gz`
- `root.tar.gz`
- `opt.tar.gz`
- `var-www.tar.gz`
- `docker-state.tar.gz`
- `database-dumps.tar.gz`

Arquivos auxiliares:
- `manifest.json`
- `RESTORE-SUMMARY.md`
- cópia local de `backup_vps_via_ssh.py`
- cópia local de `restore_vps_via_ssh.py`

## O que cada módulo cobre

`metadata.tar.gz`
- inventário do host
- listas de serviços
- rede, volumes e serviços Docker
- cron, `ufw`, `pm2`, packages e notas de restore

`etc.tar.gz`
- arquivos de configuração em `/etc`

`usr-local-bin.tar.gz`
- utilitários e scripts locais em `/usr/local/bin`

`root.tar.gz`
- conteúdo operacional em `/root`, com exclusões de cache e logs pesados

`opt.tar.gz`
- dados e apps em `/opt`

`var-www.tar.gz`
- apps sob `/var/www`

`docker-state.tar.gz`
- `volumes`, `swarm` e `network` sob `/var/lib/docker`

`database-dumps.tar.gz`
- dumps dos bancos PostgreSQL e MariaDB identificados na VPS

## Execução de backup

Exemplo de uso:

```powershell
python C:\Users\filip\DEV\VPS\backup\backup_vps_via_ssh.py `
  --host 167.86.110.57 `
  --user root `
  --password "SENHA" `
  --backup-dir C:\Users\filip\DEV\VPS\backup `
  --run-id vps-backup-AAAAMMDD
```

## Execução de restore

Por padrão o restore roda em `dry-run`:

```powershell
python C:\Users\filip\DEV\VPS\backup\restore_vps_via_ssh.py `
  --kit C:\Users\filip\DEV\VPS\backup\vps-backup-20260421-restore-kit.zip `
  --host NOVA_VPS `
  --user root `
  --password "SENHA"
```

Para aplicar de verdade:

```powershell
python C:\Users\filip\DEV\VPS\backup\restore_vps_via_ssh.py `
  --kit C:\Users\filip\DEV\VPS\backup\vps-backup-20260421-restore-kit.zip `
  --host NOVA_VPS `
  --user root `
  --password "SENHA" `
  --apply
```

## Limites conhecidos

- não é snapshot em nível de bloco
- depende de compatibilidade razoável do sistema de destino
- restaurar `docker-state.tar.gz` faz mais sentido com Docker parado
- o restore automatizado é poderoso e deve ser tratado como operação de impacto alto

## Recomendação operacional

Sempre que você fizer mudanças grandes em produção:
- regenere o kit
- atualize o hash
- valide o `dry-run` do restore
- mantenha pelo menos uma cópia extra do zip fora da máquina principal
