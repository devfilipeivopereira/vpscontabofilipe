# Schemas Públicos dos Bancos

Esta pasta contém artefatos públicos de estrutura, sem dados de produção:
- `inventory.json`
- dumps `schema-only` dos bancos PostgreSQL
- dump `no-data` do banco MariaDB do Piwigo

Objetivo:
- mapear a topologia real dos bancos
- facilitar auditoria de estrutura
- apoiar restore sem expor linhas de dados

Organização:
- `postgres/` para a instância PostgreSQL dedicada
- `supabase/` para o Postgres interno do Supabase
- `mariadb/` para o banco do Piwigo

Arquivos principais:
- `inventory.json`
- `postgres/*.schema.sql`
- `supabase/*.schema.sql`
- `mariadb/piwigodb.schema.sql`

Leitura complementar:
- [Bancos Mapeados e Backups](../../09-bancos-mapeados-e-backups.md)
- [Replicação e Recuperação](../../07-replicacao-e-recuperacao.md)
