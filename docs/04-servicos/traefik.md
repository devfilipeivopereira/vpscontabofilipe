# Traefik

## Função

Proxy reverso principal da VPS. Centraliza:
- entrada HTTP/HTTPS
- redirect automático de `http` para `https`
- roteamento por `Host()`
- emissão e renovação de certificados ACME

## Serviço

| Item | Valor |
|---|---|
| Serviço Swarm | `traefik_traefik` |
| Imagem | `traefik:v3.5.3` |
| Portas públicas | `80`, `443` |
| Rede principal | `FilipeNet` |

## Argumentos relevantes

Config observada no serviço:
- `--providers.swarm=true`
- `--providers.docker.endpoint=unix:///var/run/docker.sock`
- `--providers.docker.exposedbydefault=false`
- `--providers.docker.network=FilipeNet`
- `--entrypoints.web.address=:80`
- `--entrypoints.websecure.address=:443`
- redirect de `web` -> `websecure`
- ACME HTTP challenge em `web`
- storage ACME em `/etc/traefik/letsencrypt/acme.json`
- provider de arquivo em `/etc/traefik/dynamic`

## Mounts

| Tipo | Origem | Destino |
|---|---|---|
| bind | `/etc/traefik/dynamic` | `/etc/traefik/dynamic` |
| bind | `/var/run/docker.sock` | `/var/run/docker.sock` |
| volume | `volume_swarm_certificates` | `/etc/traefik/letsencrypt` |

## Arquivos Dinâmicos Detectados

| Arquivo | Situação |
|---|---|
| `/etc/traefik/dynamic/slides.yml` | rota para `slides.filipeivopereira.com` |
| `/etc/traefik/dynamic/openclaw.yml` | sobra antiga; OpenClaw já removido |

## Rotas Derivadas dos Labels

Rotas servidas via labels Docker:
- `work.filipeivopereira.com`
- `webhook.filipeivopereira.com`
- `directus.filipeivopereira.com`
- `evolution.filipeivopereira.com`
- `minio.filipeivopereira.com`
- `s3.filipeivopereira.com`
- `pgadmin.filipeivopereira.com`
- `port.filipeivopereira.com`
- `supabase.filipeivopereira.com`
- `fotos.igrejafamiliacrista.com`

## Certificados

Armazenamento:
- volume Docker `volume_swarm_certificates`
- mountpoint local:
  `/var/lib/docker/volumes/volume_swarm_certificates/_data`

Observação:
- a VPS não depende de `/etc/letsencrypt/live` para esses domínios

## Observações

- O Traefik é o componente central da publicação web.
- Qualquer nova aplicação pública deve ser roteada por ele, a menos que exista motivo forte para expor porta direta.
