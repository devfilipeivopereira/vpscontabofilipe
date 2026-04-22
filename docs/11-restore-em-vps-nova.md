# Restore em VPS Nova

## Objetivo

Padronizar a recuperação da VPS em um host novo, com foco em dois cenários prováveis:
- uma nova VPS na Contabo
- uma nova VPS na Hetzner

Este guia assume o uso do kit:
- `C:\Users\filip\DEV\VPS\backup\vps-backup-20260421-restore-kit.zip`

## Regra de segurança

Antes de aplicar o restore:
- confirme que o destino está vazio ou descartável
- rode primeiro o `dry-run`
- tenha acesso ao painel DNS do domínio
- tenha um caminho para reverter IP, firewall e nameservers se necessário

## Checklist Comum

1. Criar a VPS com recursos compatíveis.
   Preferência:
   - `4 vCPU`
   - `8 GB` de RAM ou mais
   - disco com folga semelhante ao atual

2. Escolher uma imagem Linux compatível.
   O host atual observado é `KDE neon User Edition 24.04`, mas para restore prático vale priorizar compatibilidade com:
   - `systemd`
   - `Docker Engine`
   - `Python 3`
   - `tar`, `gzip`, `rsync`

3. Confirmar acesso root por SSH.

4. Atualizar base mínima do host:

```bash
apt update
apt install -y docker.io python3 python3-pip curl rsync tar gzip ufw fail2ban
systemctl enable docker
systemctl start docker
```

5. Copiar o kit de backup para sua máquina local e manter o hash junto.

6. Rodar o `dry-run`:

```powershell
python C:\Users\filip\DEV\VPS\backup\restore_vps_via_ssh.py `
  --kit C:\Users\filip\DEV\VPS\backup\vps-backup-20260421-restore-kit.zip `
  --host IP_DA_NOVA_VPS `
  --user root `
  --password "SENHA"
```

7. Validar se o plano parece correto e só então aplicar:

```powershell
python C:\Users\filip\DEV\VPS\backup\restore_vps_via_ssh.py `
  --kit C:\Users\filip\DEV\VPS\backup\vps-backup-20260421-restore-kit.zip `
  --host IP_DA_NOVA_VPS `
  --user root `
  --password "SENHA" `
  --apply
```

## Contabo

Checklist específico:
- confirmar se a VPS nova usa BIOS/UEFI e layout de disco simples
- validar se o IP público principal já está atribuído desde o provisionamento
- revisar o hostname padrão da instância
- revisar regras anti-DDoS ou filtros de porta do painel, se existirem

Depois do restore:
- atualizar DNS `A` dos subdomínios para o novo IP
- validar `22`, `80` e `443`
- conferir se `3001` e `8088` continuam expostos do jeito esperado

## Hetzner

Checklist específico:
- decidir se vai usar firewall do painel da Hetzner além do `ufw`
- confirmar se o reverse DNS precisa ser ajustado
- se usar volume adicional, montar antes do restore
- revisar diferença de nome de interface de rede, caso scripts locais dependam disso

Depois do restore:
- alinhar regras do firewall da Hetzner com `ufw`
- validar acesso externo em `80/443`
- revisar qualquer dependência amarrada ao IP antigo

## Ordem de validação após `--apply`

1. Confirmar serviços base:

```bash
systemctl status docker ssh
pm2 list
docker ps
docker service ls
```

2. Confirmar rede e borda:

```bash
ufw status verbose
ss -tulpn
curl -kI https://work.filipeivopereira.com
curl -kI https://port.filipeivopereira.com
curl -kI https://supabase.filipeivopereira.com
```

3. Confirmar bancos:
- PostgreSQL dedicado
- PostgreSQL do Supabase
- MariaDB do Piwigo

4. Confirmar apps críticos:
- `n8n`
- `Portainer`
- `Supabase`
- `Directus`
- `Piwigo`
- `Evolution`

## Ajustes pós-restore que costumam faltar

- renovar ou reemitir certificados se o Traefik precisar refazer ACME
- revisar DNS se o IP mudar
- validar jobs de `cron`
- validar `pm2 resurrect`
- revisar integrações externas sensíveis a IP ou hostname

## Observação importante

O restore automatizado ajuda muito, mas não elimina validação manual.

O melhor uso desse material é:
- provisionar
- rodar `dry-run`
- aplicar
- validar borda, banco e apps
- ajustar DNS
