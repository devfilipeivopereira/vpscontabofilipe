# n8n

## Função

Automação principal publicada em:
- `work.filipeivopereira.com` -> editor/UI
- `webhook.filipeivopereira.com` -> entrada de webhooks

## Serviços da Stack

| Serviço | Papel | Imagem |
|---|---|---|
| `n8n_n8n_editor` | interface principal | `n8nio/n8n:latest` |
| `n8n_n8n_webhook` | processamento de webhooks | `n8nio/n8n:latest` |
| `n8n_n8n_worker` | worker assíncrono | `n8nio/n8n:latest` |
| `n8n_n8n_redis` | redis de apoio | `redis:latest` |

## Publicação

| Domínio | Serviço | Porta interna | Status |
|---|---|---:|---|
| `work.filipeivopereira.com` | `n8n_editor` | `5678` | `HTTP 200` |
| `webhook.filipeivopereira.com` | `n8n_webhook` | `5678` | `HTTP 404` na raiz |

## Comandos / Args observados

| Serviço | Args |
|---|---|
| `n8n_n8n_editor` | `start` |
| `n8n_n8n_webhook` | `webhook` |
| `n8n_n8n_worker` | `worker --concurrency=10` |
| `n8n_n8n_redis` | `redis-server --appendonly yes --port 6379` |

## Persistência

Persistência observada:
- `n8n_n8n_redis` usa volume `n8n_redis` em `/data`

Observação importante:
- não foi identificado `mount` persistente direto nos serviços `editor`, `webhook` e `worker` via `docker service inspect`
- isso não prova ausência total de persistência no desenho do n8n, mas é um ponto que merece revisão se a expectativa for armazenamento local durável por volume bind/named volume

## Alertas Operacionais

- `webhook.filipeivopereira.com` responder `404` em `/` não indica quebra
- o worker usa concorrência `10`; isso é uma decisão operacional relevante para carga e throughput
