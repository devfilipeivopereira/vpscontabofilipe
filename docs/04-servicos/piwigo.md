# Piwigo

## Função

Galeria de fotos publicada em:
- `fotos.igrejafamiliacrista.com`

Também está acessível por publish direto:
- `:8088`

## Componentes

| Serviço | Papel | Imagem |
|---|---|---|
| `piwigo_piwigo` | app principal | `lscr.io/linuxserver/piwigo:latest` |
| `piwigo_piwigo_db` | banco MariaDB | `mariadb:11.4` |

## Publicação

| Entrada | Status |
|---|---|
| `fotos.igrejafamiliacrista.com` | `HTTP 200` |
| `http://<host>:8088` | `HTTP 200` |

## Persistência do App

| Tipo | Origem | Destino |
|---|---|---|
| bind | `/opt/piwigo/config` | `/config` |
| bind | `/opt/piwigo/gallery` | `/gallery` |
| bind | `/opt/piwigo/scripts` | `/custom-cont-init.d` |

## Persistência do Banco

| Tipo | Origem | Destino |
|---|---|---|
| bind | `/opt/piwigo/mysql` | `/var/lib/mysql` |

## Banco

Args observados no MariaDB:
- `--transaction-isolation=READ-COMMITTED`
- `--binlog-format=ROW`
- `--character-set-server=utf8mb4`
- `--collation-server=utf8mb4_unicode_ci`

## Observações

- O Piwigo é um dos serviços mais simples de operar neste host, porque usa binds explícitos em `/opt/piwigo`.
- Como também está exposto em `8088`, há uma superfície adicional fora do Traefik.
