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

## Artefatos extraídos para recuperação

Do volume `portainer_data`, foram capturados:
- `compose/*/docker-compose.yml` para as stacks `postgres`, `n8n`, `supabase`, `evolution`, `minio`, `directus` e `pgadmin`
- `portainer.db`, preservado apenas no kit privado

Versões sanitizadas das compose files foram publicadas em:
- [Artefatos Sanitizados do Portainer](../artefatos/portainer-stacks-sanitizadas/README.md)

Documentação operacional complementar:
- [Portainer, YAMLs e Backup Privado](../08-portainer-yamls-e-backup-privado.md)

## Observação importante

Nem tudo o que roda na VPS apareceu em `portainer_data/_data/compose`.

Ficaram fora desse snapshot:
- `traefik`
- `portainer`
- `piwigo`
- `uptime-kuma`

Esses componentes precisam ser restaurados a partir da documentação geral, dos snapshots privados e dos artefatos do host.
