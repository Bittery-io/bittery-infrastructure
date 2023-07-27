#!/bin/bash
SQL_BACKUP_FILE=/home/peer/Programowanie/bittery/bittery-infrastructure-v2/tools/postgres-backup/backups/01-12-2021-14_59_pg_backup.sql
DATABASE=bitteryio_testnet
HOST=94.190.155.74
PORT=5431
USER=700d77a0-1f8c-43fb-b669-3f983d59a79c
export PGPASSWORD="91af48cd-ac44-46ba-8fb5-f5c993587003"

psql -U ${USER} -d ${DATABASE} -p ${PORT} -h ${HOST} < ${SQL_BACKUP_FILE}
