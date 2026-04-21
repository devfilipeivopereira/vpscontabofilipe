# PgAdmin

## Função

Interface web de administração de PostgreSQL.

## Serviço

| Item | Valor |
|---|---|
| Serviço | `pgadmin_pgadmin` |
| Imagem | `dpage/pgadmin4:latest` |
| Porta interna | `80` |
| Domínio | `pgadmin.filipeivopereira.com` |
| Status | `HTTP 302` |

## Persistência

| Tipo | Origem | Destino |
|---|---|---|
| volume | `pgadmin_data` | `/var/lib/pgadmin` |

## Observações

- Está publicado via Traefik, não por porta direta.
