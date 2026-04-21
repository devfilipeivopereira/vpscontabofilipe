# Portainer, YAMLs e Backup Privado

## O que foi extraído

Do volume `portainer_data` foram capturados:
- `portainer_data/_data/compose/*/docker-compose.yml`
- `portainer_data/_data/portainer.db`

Do host foram capturados como complemento:
- snapshots de `docker service inspect`
- `docker stack ls`, `docker service ls`, `docker volume ls`
- `docker network inspect FilipeNet`
- arquivos dinâmicos do Traefik
- `ecosystem.config.cjs` do `slides`
- scripts de backup detectados

## Onde cada camada ficou

Camada privada:
- `PRIVATE_BACKUP_ROOT/contabo/2026-04-21`
- `PRIVATE_BACKUP_ROOT/contabo/contabo-recovery-kit-2026-04-21.zip`

Camada pública:
- [Artefatos Sanitizados do Portainer](artefatos/portainer-stacks-sanitizadas/README.md)

## Mapa das compose detectadas

| Compose ID | Stack | Serviços | Domínios observados | Artefato sanitizado |
|---:|---|---|---|---|
| `1` | `postgres` | `postgres` | - | [compose-1-postgres.sanitized.yml](artefatos/portainer-stacks-sanitizadas/compose-1-postgres.sanitized.yml) |
| `2` | `n8n` | `n8n_editor`, `n8n_webhook`, `n8n_worker`, `n8n_redis` | `work.filipeivopereira.com`, `webhook.filipeivopereira.com` | [compose-2-n8n.sanitized.yml](artefatos/portainer-stacks-sanitizadas/compose-2-n8n.sanitized.yml) |
| `6` | `supabase` | `supabase_studio`, `supabase_kong`, `supabase_auth`, `supabase_rest`, `supabase_realtime`, `supabase_storage`, `supabase_imgproxy`, `supabase_meta`, `supabase_functions`, `supabase_analytics`, `supabase_db`, `supabase_vector`, `supabase_supavisor` | `supabase.filipeivopereira.com` | [compose-6-supabase.sanitized.yml](artefatos/portainer-stacks-sanitizadas/compose-6-supabase.sanitized.yml) |
| `7` | `evolution` | `evolution_api`, `evolution_redis` | `evolution.filipeivopereira.com` | [compose-7-evolution.sanitized.yml](artefatos/portainer-stacks-sanitizadas/compose-7-evolution.sanitized.yml) |
| `8` | `minio` | `minio` | `minio.filipeivopereira.com`, `s3.filipeivopereira.com` | [compose-8-minio.sanitized.yml](artefatos/portainer-stacks-sanitizadas/compose-8-minio.sanitized.yml) |
| `10` | `directus` | `directus_app`, `directus_redis` | `directus.filipeivopereira.com` | [compose-10-directus.sanitized.yml](artefatos/portainer-stacks-sanitizadas/compose-10-directus.sanitized.yml) |
| `11` | `pgadmin` | `pgadmin` | `pgadmin.filipeivopereira.com` | [compose-11-pgadmin.sanitized.yml](artefatos/portainer-stacks-sanitizadas/compose-11-pgadmin.sanitized.yml) |

## O que não apareceu nas compose do Portainer

Não estavam nesse conjunto:
- `traefik`
- `portainer`
- `piwigo`
- `uptime-kuma`

Na prática, isso significa que o backup do Portainer é importantíssimo, mas não é suficiente sozinho para reerguer a VPS inteira.

## Divergência detectada

Foi encontrada uma divergência entre o YAML salvo e o estado em execução:

| Serviço | Imagem na compose | Imagem em execução |
|---|---|---|
| `supabase_supabase_studio` | `supabase/studio:2026.01.27-sha-2a37755` | `supabase/studio:2025.11.10-sha-5291fe3` |

Isso merece validação antes de qualquer restauração, porque restaurar “pela compose” e restaurar “pelo estado atual” podem produzir resultados diferentes.

## Observações de segurança

- As compose brutas contêm segredos reais.
- `portainer.db` também deve ser tratado como sensível.
- Se esses artefatos brutos forem compartilhados fora do ambiente controlado, a resposta correta é considerar rotação de segredos.
- O repositório público deve continuar recebendo apenas material sanitizado.
