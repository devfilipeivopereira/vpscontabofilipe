# Docker Swarm e Containers

## Estado do Swarm

| Item | Valor |
|---|---|
| Estado | `active` |
| Papel do nó | `Leader` |
| Node ID | `qdyp9daalouyml4dlu4yptuwy` |
| Hostname | `Drf22062014` |

Não há cluster multinó detectado. O Swarm está operando em nó único.

## Redes Docker

| Rede | Driver | Escopo | Uso |
|---|---|---|---|
| `FilipeNet` | overlay | swarm | rede principal do Traefik/stacks |
| `ingress` | overlay | swarm | ingress padrão do Swarm |
| `piwigo_piwigo_private` | overlay | swarm | rede privada da stack Piwigo |
| `bridge` | bridge | local | rede padrão |
| `docker_gwbridge` | bridge | local | gateway do Swarm |

## Volumes Detectados

Volumes locais relevantes:
- `directus_data`
- `directus_uploads`
- `directus_redis`
- `evolution_instances`
- `evolution_instancesv2`
- `evolution_redis`
- `minio_data`
- `n8n_redis`
- `pgadmin_data`
- `portainer_data`
- `postgres_data`
- `supabase_db_config`
- `supabase_storage`
- `uptime-kuma`
- `volume_swarm_certificates`

## Serviços Swarm Ativos

Todos observados com `1/1` réplicas:

### Traefik
- `traefik_traefik`

### n8n
- `n8n_n8n_editor`
- `n8n_n8n_webhook`
- `n8n_n8n_worker`
- `n8n_n8n_redis`

### Directus
- `directus_directus_app`
- `directus_directus_redis`

### Evolution
- `evolution_evolution_api`
- `evolution_evolution_redis`

### MinIO
- `minio_minio`

### PgAdmin
- `pgadmin_pgadmin`

### Piwigo
- `piwigo_piwigo`
- `piwigo_piwigo_db`

### Portainer
- `portainer_portainer`
- `portainer_agent`

### Postgres
- `postgres_postgres`

### Supabase
- `supabase_supabase_analytics`
- `supabase_supabase_auth`
- `supabase_supabase_db`
- `supabase_supabase_functions`
- `supabase_supabase_imgproxy`
- `supabase_supabase_kong`
- `supabase_supabase_meta`
- `supabase_supabase_realtime`
- `supabase_supabase_rest`
- `supabase_supabase_storage`
- `supabase_supabase_studio`
- `supabase_supabase_supavisor`
- `supabase_supabase_vector`

## Container Standalone

Fora do Swarm, foi detectado:
- `uptime-kuma`

Esse container usa a rede `bridge` e publica a porta `3001` diretamente no host.

## Observações Operacionais

- `docker-proxy` está cuidando de `80`, `443`, `3001` e `8088`
- `uptime-kuma` não está empacotado em stack Swarm
- o `Piwigo` tem dupla exposição: via domínio no Traefik e via publish direto em `8088`
