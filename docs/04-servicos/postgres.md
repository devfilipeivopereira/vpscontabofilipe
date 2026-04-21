# Postgres Dedicado

## Função

Banco PostgreSQL dedicado fora da stack Supabase.

## Serviço

| Item | Valor |
|---|---|
| Serviço | `postgres_postgres` |
| Imagem | `postgres:14` |
| Porta interna | `5432` |

## Args observados

- `postgres`
- `-c max_connections=500`
- `-c shared_buffers=512MB`
- `-c timezone=America/Sao_Paulo`

## Persistência

| Tipo | Origem | Destino |
|---|---|---|
| volume | `postgres_data` | `/var/lib/postgresql/data` |

## Observações

- Esse Postgres é separado do banco interno do Supabase.
- A existência dele sugere uso por alguma aplicação/stack distinta, que precisa ser mapeada operacionalmente se ainda não estiver documentada em outro lugar.
