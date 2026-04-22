# Backups Criptografados dos Bancos

Esta pasta contém os dumps completos dos bancos publicados de forma criptografada.

## Conteúdo

- backups da instância PostgreSQL dedicada
- backups da instância PostgreSQL do Supabase
- backup do MariaDB do Piwigo
- [manifest.json](manifest.json) com arquivos, hashes e modo de armazenamento

## Formato

Cada backup foi empacotado assim:
- prefixo mágico `AESGCM1`
- nonce de `12` bytes
- ciphertext `AES-GCM`

Quando um backup ultrapassou o tamanho desejado para versionamento, ele foi dividido em partes `.part001`, `.part002`, etc.

## Chave

A chave não está neste repositório.

Local esperado:
- `PRIVATE_BACKUP_ROOT/contabo/keys/db-backup-aesgcm-key-2026-04-21.base64.txt`

## Restore

Use o script:

```bash
python scripts/decrypt_db_backup.py \
  --manifest backups/encrypted-databases/2026-04-21/manifest.json \
  --instance postgres \
  --database evolution \
  --key-file PRIVATE_BACKUP_ROOT/contabo/keys/db-backup-aesgcm-key-2026-04-21.base64.txt \
  --output evolution.dump
```

Depois:

PostgreSQL custom dump:

```bash
pg_restore --clean --if-exists --no-owner --no-privileges -d DESTINO evolution.dump
```

MariaDB gzip dump:

```bash
python scripts/decrypt_db_backup.py \
  --manifest backups/encrypted-databases/2026-04-21/manifest.json \
  --instance piwigo \
  --database piwigodb \
  --key-file PRIVATE_BACKUP_ROOT/contabo/keys/db-backup-aesgcm-key-2026-04-21.base64.txt \
  --output piwigodb.sql.gz

gzip -dc piwigodb.sql.gz | mariadb -u USUARIO -p BANCO
```
