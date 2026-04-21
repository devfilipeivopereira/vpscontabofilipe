# Uptime Kuma

## Função

Monitoramento/uptime dashboard.

## Modelo de Execução

Não roda como stack Swarm. Foi detectado como container standalone:
- nome: `uptime-kuma`
- imagem: `louislam/uptime-kuma:latest`
- rede: `bridge`

## Publicação

| Porta | Status |
|---:|---|
| `3001` | `HTTP 302` |

## Persistência

| Tipo | Origem | Destino |
|---|---|---|
| volume | `uptime-kuma` | `/app/data` |

Mountpoint local do volume:
- `/var/lib/docker/volumes/uptime-kuma/_data`

## Healthcheck

Healthcheck detectado:
- `extra/healthcheck`
- interval: `60s`
- timeout: `30s`
- start period: `180s`
- retries: `5`

O container estava `healthy` na coleta.

## Observações

- Como não está no Swarm, a operação dele é diferente do restante da stack principal.
- Está exposto diretamente em porta pública, não atrás do Traefik.
