# Bancos Mapeados e Backups

## Visão geral

A VPS hoje usa três instâncias reais de banco:
- `postgres` dedicado para apps de negócio
- `supabase` com seu Postgres interno
- `piwigo_piwigo_db` em MariaDB

Nesta rodada foram gerados:
- inventário público dos bancos e schemas
- dumps públicos apenas de schema
- dumps completos criptografados versionados no GitHub

## Mapa dos bancos

| Instância | Engine | Banco | Tamanho | Tabelas | Schema pública |
|---|---|---|---:|---:|---|
| `postgres` | PostgreSQL | `directus` | `15 MB` | `31` | [directus.schema.sql](artefatos/database-schemas/postgres/directus.schema.sql) |
| `postgres` | PostgreSQL | `evolution` | `438 MB` | `37` | [evolution.schema.sql](artefatos/database-schemas/postgres/evolution.schema.sql) |
| `postgres` | PostgreSQL | `n8n_queue` | `14 MB` | `54` | [n8n_queue.schema.sql](artefatos/database-schemas/postgres/n8n_queue.schema.sql) |
| `postgres` | PostgreSQL | `postgres` | `8593 kB` | `0` | [postgres.schema.sql](artefatos/database-schemas/postgres/postgres.schema.sql) |
| `supabase` | PostgreSQL | `postgres` | `347 MB` | `159` | [postgres.schema.sql](artefatos/database-schemas/supabase/postgres.schema.sql) |
| `supabase` | PostgreSQL | `_supabase` | `10 MB` | `40` | [supabase_internal.schema.sql](artefatos/database-schemas/supabase/supabase_internal.schema.sql) |
| `piwigo` | MariaDB | `piwigodb` | `2.19 MB` | `34` | [piwigodb.schema.sql](artefatos/database-schemas/mariadb/piwigodb.schema.sql) |

## Schemas mais relevantes

No `supabase/postgres`, os schemas de aplicação observados foram:
- `auth`
- `storage`
- `realtime`
- `supabase_functions`
- `vault`
- `graphql`
- `public`

No `supabase/_supabase`, os schemas observados foram:
- `_analytics`
- `_supavisor`
- `public`

Nos bancos `directus`, `evolution` e `n8n_queue`, a superfície útil ficou concentrada em `public`.

## Backups completos no GitHub

Os dumps completos não foram publicados em texto puro.

Eles estão em:
- [backups/encrypted-databases/2026-04-21/README.md](../backups/encrypted-databases/2026-04-21/README.md)
- [backups/encrypted-databases/2026-04-21/manifest.json](../backups/encrypted-databases/2026-04-21/manifest.json)

Formato adotado:
- dumps PostgreSQL em formato custom `pg_dump -Fc`
- dump MariaDB em `sql.gz`
- criptografia local em `AESGCM1`
- chave mantida fora do Git, em `PRIVATE_BACKUP_ROOT`

## Observação importante

O arquivo [C:\Users\filip\DEV\sistema-painel-ifc\.env](C:/Users/filip/DEV/sistema-painel-ifc/.env) confirmou o uso do `supabase.filipeivopereira.com` e ajudou a validar a camada Supabase dentro do mapa, mas esse arquivo não foi copiado para o repositório porque contém segredos reais.
