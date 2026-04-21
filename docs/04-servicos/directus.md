# Directus

## Função

CMS/headless backend publicado em:
- `directus.filipeivopereira.com`

## Componentes

| Serviço | Papel | Imagem |
|---|---|---|
| `directus_directus_app` | app Directus | `directus/directus:11.15.0` |
| `directus_directus_redis` | redis auxiliar | `redis:latest` |

## Publicação

| Domínio | Porta interna | Status |
|---|---:|---|
| `directus.filipeivopereira.com` | `8055` | `HTTP 302` |

## Persistência

| Serviço | Tipo | Origem | Destino |
|---|---|---|---|
| `directus_directus_app` | volume | `directus_uploads` | `/directus/uploads` |
| `directus_directus_app` | volume | `directus_data` | `/directus/database` |
| `directus_directus_redis` | volume | `directus_redis` | `/data` |

## Volumes locais

| Volume | Mountpoint |
|---|---|
| `directus_data` | `/var/lib/docker/volumes/directus_data/_data` |
| `directus_uploads` | `/var/lib/docker/volumes/directus_uploads/_data` |

## Observações

- O Directus está com persistência explícita para banco interno/artefatos e uploads.
- O Redis da stack usa append-only, o que ajuda a manter estado entre reinícios.
