# Evolution API

## Função

API publicada em:
- `evolution.filipeivopereira.com`

## Componentes

| Serviço | Papel | Imagem |
|---|---|---|
| `evolution_evolution_api` | app principal | `evoapicloud/evolution-api:latest` |
| `evolution_evolution_redis` | redis auxiliar | `redis:latest` |

## Publicação

| Domínio | Porta interna | Status |
|---|---:|---|
| `evolution.filipeivopereira.com` | `8080` | `HTTP 200` |

## Persistência

| Serviço | Tipo | Origem | Destino |
|---|---|---|---|
| `evolution_evolution_api` | volume | `evolution_instances` | `/evolution/instances` |
| `evolution_evolution_redis` | volume | `evolution_redis` | `/data` |

## Observações

- Existe também o volume `evolution_instancesv2` no host, indicando histórico ou versão alternativa de persistência.
- A API está atrás do Traefik com `passHostHeader=true`.
