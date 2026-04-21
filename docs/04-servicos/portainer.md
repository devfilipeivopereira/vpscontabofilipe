# Portainer

## Função

Gerência do ambiente Docker/Swarm.

## Componentes

| Serviço | Papel | Imagem |
|---|---|---|
| `portainer_portainer` | UI / API | `portainer/portainer-ce:latest` |
| `portainer_agent` | agent do nó | `portainer/agent:latest` |

## Publicação

| Domínio | Porta interna | Status |
|---|---:|---|
| `port.filipeivopereira.com` | `9000` | `HTTP 200` |

## Configuração Relevante

Args do Portainer:
- `-H tcp://tasks.agent:9001`
- `--tlsskipverify`

Isso indica que a UI fala com o `portainer_agent` através do endpoint de tasks do Swarm.

## Persistência

| Serviço | Tipo | Origem | Destino |
|---|---|---|---|
| `portainer_portainer` | volume | `portainer_data` | `/data` |
| `portainer_agent` | bind | `/var/run/docker.sock` | `/var/run/docker.sock` |
| `portainer_agent` | bind | `/var/lib/docker/volumes` | `/var/lib/docker/volumes` |

## Volume local

| Volume | Mountpoint |
|---|---|
| `portainer_data` | `/var/lib/docker/volumes/portainer_data/_data` |
