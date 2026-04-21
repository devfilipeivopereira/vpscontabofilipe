# Supabase

## Função

Stack completa do Supabase, publicada publicamente pelo gateway Kong em:
- `supabase.filipeivopereira.com`

## Serviço Público

| Domínio | Serviço | Porta | Status |
|---|---|---:|---|
| `supabase.filipeivopereira.com` | `supabase_supabase_kong` | `8000` | `HTTP 401` |

O `401` é compatível com gateway vivo exigindo credenciais/header adequados.

## Serviços da Stack

| Serviço | Papel | Imagem |
|---|---|---|
| `supabase_supabase_kong` | gateway/API | `kong:2.8.1` |
| `supabase_supabase_db` | banco principal | `supabase/postgres:15.8.1.085` |
| `supabase_supabase_auth` | auth/gotrue | `supabase/gotrue:v2.182.1` |
| `supabase_supabase_rest` | PostgREST | `postgrest/postgrest:v13.0.7` |
| `supabase_supabase_realtime` | realtime | `supabase/realtime:v2.63.0` |
| `supabase_supabase_storage` | storage API | `supabase/storage-api:v1.29.0` |
| `supabase_supabase_studio` | studio interno | `supabase/studio:2025.11.10-sha-5291fe3` |
| `supabase_supabase_meta` | postgres-meta | `supabase/postgres-meta:v0.93.1` |
| `supabase_supabase_supavisor` | pooler | `supabase/supavisor:2.7.4` |
| `supabase_supabase_functions` | edge runtime | `supabase/edge-runtime:v1.69.23` |
| `supabase_supabase_imgproxy` | proxy de imagem | `darthsim/imgproxy:v3.8.0` |
| `supabase_supabase_analytics` | analytics/logflare | `supabase/logflare:1.22.6` |
| `supabase_supabase_vector` | coleta/log forwarding | `timberio/vector:0.28.1-alpine` |

## Base Operacional em Disco

Diretório principal detectado:
- `/root/supabase/docker`

Subestruturas relevantes:
- `/root/supabase/docker/volumes/api/kong.yml`
- `/root/supabase/docker/volumes/db/*`
- `/root/supabase/docker/volumes/functions/*`
- `/root/supabase/docker/volumes/logs/vector.yml`
- `/root/supabase/docker/volumes/pooler/pooler.exs`
- `/root/supabase/docker/volumes/storage`

## Persistência / Mounts Relevantes

### Banco

O serviço `supabase_supabase_db` usa vários binds:
- `/root/supabase/docker/volumes/db/data` -> `/var/lib/postgresql/data`
- arquivos SQL de init/migrations bindados em `/docker-entrypoint-initdb.d/*`
- volume `supabase_db_config` -> `/etc/postgresql-custom`

### Functions

`supabase_supabase_functions`:
- `/root/supabase/docker/volumes/functions` -> `/home/deno/functions`

### Imgproxy

`supabase_supabase_imgproxy`:
- `/root/supabase/docker/volumes/storage` -> `/var/lib/storage`

### Vector

`supabase_supabase_vector`:
- `/root/supabase/docker/volumes/logs/vector.yml` -> `/etc/vector/vector.yml`
- `/var/run/docker.sock` -> `/var/run/docker.sock`

### Pooler

`supabase_supabase_supavisor`:
- `/root/supabase/docker/volumes/pooler/pooler.exs` -> `/etc/pooler/pooler.exs`

### Storage

`supabase_supabase_storage`:
- volume `supabase_storage` -> `/var/lib/storage`

## Observações

- É a stack mais complexa da VPS.
- Existe separação clara entre config bindada, dados do banco e funções.
- O Studio está ativo, mas não foi identificado domínio público específico para ele; o acesso público mapeado passa pelo gateway Kong.
