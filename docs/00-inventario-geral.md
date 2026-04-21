# Inventário Geral

## Identidade do Servidor

| Item | Valor |
|---|---|
| IP público | `167.86.110.57` |
| Hostname | `Drf22062014` |
| Virtualização | `KVM` |
| Sistema | `KDE neon User Edition 24.04 (noble)` |
| Kernel | `6.8.0-106-generic` |
| CPU | `4 vCPU` |
| Memória | `7.8 GiB RAM` |
| Swap | `4 GiB` |
| Disco raiz | `290 GiB` |

## Serviços Públicos Identificados

| Domínio / Porta | Serviço | Camada | Status observado |
|---|---|---|---|
| `work.filipeivopereira.com` | n8n editor | Traefik | `HTTP 200` |
| `webhook.filipeivopereira.com` | n8n webhook | Traefik | `HTTP 404` na raiz |
| `directus.filipeivopereira.com` | Directus | Traefik | `HTTP 302` |
| `evolution.filipeivopereira.com` | Evolution API | Traefik | `HTTP 200` |
| `minio.filipeivopereira.com` | MinIO Console | Traefik | `HTTP 200` |
| `s3.filipeivopereira.com` | MinIO S3 | Traefik | `HTTP 400` na raiz |
| `pgadmin.filipeivopereira.com` | PgAdmin | Traefik | `HTTP 302` |
| `port.filipeivopereira.com` | Portainer | Traefik | `HTTP 200` |
| `supabase.filipeivopereira.com` | Supabase Kong | Traefik | `HTTP 401` |
| `fotos.igrejafamiliacrista.com` | Piwigo | Traefik | `HTTP 200` |
| `:3000` | Slides | PM2 | `HTTP 200` local |
| `:3001` | Uptime Kuma | Docker standalone | `HTTP 302` |
| `:8088` | Piwigo | Docker publish direto | `HTTP 200` |

## Serviços de Infraestrutura Relevantes

Ativos no sistema:
- `docker.service`
- `containerd.service`
- `ssh.service`
- `fail2ban.service`
- `cron.service`
- `pm2-root.service`
- `monarx-agent.service`

Desativados:
- `xrdp.service`
- `xrdp-sesman.service`

Removidos do runtime:
- `openclaw`

## Stacks e Apps em Execução

Docker Swarm:
- `traefik`
- `n8n`
- `directus`
- `evolution`
- `minio`
- `pgadmin`
- `piwigo`
- `portainer`
- `postgres`
- `supabase`

Container standalone:
- `uptime-kuma`

PM2:
- `slides`

## Diretórios Operacionais Detectados

| Caminho | Função |
|---|---|
| `/root/supabase/docker` | base de configuração e volumes bind do Supabase |
| `/var/www/slides-app` | código do app `slides` em PM2 |
| `/opt/piwigo/*` | binds persistentes do Piwigo |
| `/opt/backups` | arquivos `.tar.gz` de backup detectados |
| `/etc/traefik/dynamic` | regras dinâmicas do Traefik |
| `/var/lib/docker/volumes` | volumes locais do Docker |
| `/root/.pm2` | estado e logs do PM2 |

## Projetos Locais Detectados, Mas Não Necessariamente Publicados

| Caminho | Observação |
|---|---|
| `/root/moltbot` | repositório local grande; contém código, docs e artefatos relacionados a OpenClaw/Clawbot |
| `/opt/message-sender-pro` | projeto local encontrado em disco, sem publicação pública detectada nesta inspeção |
| `/var/www/html/index.nginx-debian.html` | página padrão de nginx ainda existe em disco, mas nginx não é o proxy ativo dos domínios |
