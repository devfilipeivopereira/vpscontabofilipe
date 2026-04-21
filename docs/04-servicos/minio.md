# MinIO

## Função

Armazenamento S3 compatível e console administrativo.

## Serviço

| Item | Valor |
|---|---|
| Serviço | `minio_minio` |
| Imagem | `quay.io/minio/minio:latest` |
| Args | `server /data --console-address :9001` |

## Publicação

| Domínio | Uso | Porta interna | Status |
|---|---|---:|---|
| `minio.filipeivopereira.com` | console | `9001` | `HTTP 200` |
| `s3.filipeivopereira.com` | API S3 | `9000` | `HTTP 400` na raiz |

## Persistência

| Tipo | Origem | Destino |
|---|---|---|
| volume | `minio_data` | `/data` |

## Observações

- O `400` no domínio `s3` é compatível com endpoint S3 respondendo a uma requisição genérica na raiz, sem assinatura/operação válida.
