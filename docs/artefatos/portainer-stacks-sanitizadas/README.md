# Artefatos Sanitizados do Portainer

Esta pasta contém snapshots sanitizados das compose files encontradas em:
- `/var/lib/docker/volumes/portainer_data/_data/compose`

Objetivo:
- versionar a estrutura real das stacks salvas no Portainer
- preservar serviços, volumes, redes, labels e domínios
- remover valores sensíveis antes de publicar no repositório

Arquivos incluídos:
- `compose-1-postgres.sanitized.yml`
- `compose-2-n8n.sanitized.yml`
- `compose-6-supabase.sanitized.yml`
- `compose-7-evolution.sanitized.yml`
- `compose-8-minio.sanitized.yml`
- `compose-10-directus.sanitized.yml`
- `compose-11-pgadmin.sanitized.yml`
- `manifest.json`

Leitura recomendada:
- `manifest.json` para inventário estruturado
- [Portainer, YAMLs e Backup Privado](../../08-portainer-yamls-e-backup-privado.md) para contexto operacional
- [Replicação e Recuperação](../../07-replicacao-e-recuperacao.md) para o fluxo de restore

Importante:
- estas compose files não substituem o kit privado
- as versões brutas continuam necessárias quando a meta é restauração fiel com segredos intactos
