# Rede, Domínios e Firewall

## Portas em Escuta

Portas relevantes detectadas:

| Porta | Origem | Observação |
|---:|---|---|
| `22` | `sshd` | acesso SSH |
| `80` | `docker-proxy` / Traefik | HTTP público |
| `443` | `docker-proxy` / Traefik | HTTPS público |
| `3000` | PM2 | app `slides` |
| `3001` | Docker | `uptime-kuma` |
| `8088` | Docker | `piwigo` |
| `2377` | Docker Swarm | controle Swarm |
| `7946` | Docker Swarm | overlay/network discovery |

## Firewall UFW

Regras explícitas observadas:
- `22`
- `80`
- `443`

Importante:
- não havia regra explícita do `ufw` para `3001` ou `8088`
- mesmo assim essas portas estavam em `LISTEN` via `docker-proxy`
- em hosts Docker isso pode significar exposição efetiva independente do `ufw`, por conta do gerenciamento de `iptables` pelo Docker

## Domínios Públicos

| Domínio | Serviço | Status | Interpretação |
|---|---|---|---|
| `work.filipeivopereira.com` | n8n editor | `200` | funcional |
| `webhook.filipeivopereira.com` | n8n webhook | `404` | normal para raiz do webhook |
| `directus.filipeivopereira.com` | Directus | `302` | funcional com redirect |
| `evolution.filipeivopereira.com` | Evolution API | `200` | funcional |
| `minio.filipeivopereira.com` | MinIO console | `200` | funcional |
| `s3.filipeivopereira.com` | MinIO S3 | `400` | endpoint vivo; raiz inválida |
| `pgadmin.filipeivopereira.com` | PgAdmin | `302` | funcional |
| `port.filipeivopereira.com` | Portainer | `200` | funcional |
| `supabase.filipeivopereira.com` | Supabase Kong | `401` | funcional, auth requerida |
| `fotos.igrejafamiliacrista.com` | Piwigo | `200` | funcional |

## TLS e Certificados

Observações:
- não foi encontrado uso ativo de `/etc/letsencrypt/live`
- o Traefik está configurado para resolver certificados via ACME
- o armazenamento do ACME fica em volume Docker:
  `/var/lib/docker/volumes/volume_swarm_certificates/_data`

## Traefik Dynamic Config

Arquivos detectados em `/etc/traefik/dynamic`:
- `slides.yml`
- `openclaw.yml`

Situação:
- `slides.yml` cria uma rota para `slides.filipeivopereira.com`
- o upstream configurado é `http://76.13.168.1:3000`
- esse upstream não foi validado com sucesso a partir da própria VPS
- `openclaw.yml` é um resquício antigo, porque o runtime do OpenClaw já foi removido

Isso significa que a configuração dinâmica do Traefik hoje contém pelo menos uma sobra antiga (`openclaw`) e uma rota (`slides`) que merece validação ou ajuste.
