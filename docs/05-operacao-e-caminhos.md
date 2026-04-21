# Operação, Caminhos e Comandos Úteis

## Caminhos Importantes

| Caminho | Uso |
|---|---|
| `/root/supabase/docker` | config/base do Supabase |
| `/etc/traefik/dynamic` | regras dinâmicas do Traefik |
| `/var/lib/docker/volumes/portainer_data/_data/compose` | compose files persistidas pelo Portainer |
| `/var/lib/docker/volumes/portainer_data/_data/portainer.db` | base interna do Portainer |
| `/var/lib/docker/volumes` | volumes Docker |
| `/var/www/slides-app` | app `slides` |
| `/root/.pm2` | PM2 state/logs |
| `/opt/piwigo` | dados e config do Piwigo |
| `/opt/backups` | backups em `.tar.gz` detectados |

## Comandos de Estado

Visão geral:

```bash
uptime
free -h
df -h
```

Serviços do sistema:

```bash
systemctl list-units --type=service --state=running
systemctl status docker ssh fail2ban pm2-root
```

Firewall:

```bash
ufw status verbose
fail2ban-client status
```

## Docker e Swarm

Resumo:

```bash
docker service ls
docker ps
docker stats --no-stream
docker node ls
docker network ls
docker volume ls
```

Logs de serviço:

```bash
docker service logs n8n_n8n_editor
docker service logs traefik_traefik
docker service logs portainer_portainer
```

Inspeção de um serviço:

```bash
docker service inspect n8n_n8n_editor
docker service inspect supabase_supabase_kong
```

Backup bruto do Portainer:

```bash
tar -czf /root/portainer-compose-backup.tgz -C /var/lib/docker/volumes/portainer_data/_data compose portainer.db
```

## PM2

```bash
pm2 list
pm2 logs slides
pm2 describe slides
pm2 save
```

## Verificação de Endpoints

```bash
curl -kI https://work.filipeivopereira.com
curl -kI https://port.filipeivopereira.com
curl -kI https://supabase.filipeivopereira.com
curl -I http://127.0.0.1:3000
curl -I http://127.0.0.1:3001
curl -I http://127.0.0.1:8088
```

## Backups Detectados

No momento da coleta, existiam artefatos em `/opt/backups` como:
- `evolution-instancesv2-2026-04-21_03-00.tar.gz`
- `minio-2026-04-21_03-00.tar.gz`
- `pgadmin-2026-04-21_03-00.tar.gz`
- `portainer-2026-04-21_03-00.tar.gz`
- `postgres-2026-04-21_03-00.tar.gz`
- `supabase-storage-2026-04-21_03-00.tar.gz`
- `uptime-kuma-2026-04-21_03-00.tar.gz`

Essa pasta merece uma política documentada à parte se os backups forem parte do fluxo oficial.

## Recuperação e replicação

Material complementar:
- [Replicação e Recuperação](07-replicacao-e-recuperacao.md)
- [Portainer, YAMLs e Backup Privado](08-portainer-yamls-e-backup-privado.md)
