#!/bin/bash
#
# Backup a Postgresql database into a daily backup file.
#

BACKUP_DIR=./backups
DAYS_TO_KEEP=14
FILE_SUFFIX=_pg_backup.sql
DATABASE=bittteryio
HOST=94.190.155.74
PORT=5431
USER="700d77a0-1f8c-43fb-b669-3f983d59a79c"
export PGPASSWORD="91af48cd-ac44-46ba-8fb5-f5c993587003"
FILE=`date +"%d-%m-%Y-%-H_%M"`${FILE_SUFFIX}

OUTPUT_FILE=${BACKUP_DIR}/${FILE}

mkdir -p $BACKUP_DIR
# do the database backup (dump)
# use this command for a database server on localhost. add other options if need be.
pg_dump -U ${USER} -d ${DATABASE} -f ./backup.sql -p ${PORT} -h ${HOST}  -F p -f ${OUTPUT_FILE} -w
# gzip the mysql database dump file
gzip $OUTPUT_FILE

# show the user the result
echo "${OUTPUT_FILE}.gz was created:"
ls -l ${OUTPUT_FILE}.gz

# prune old backups
find $BACKUP_DIR -maxdepth 1 -mtime +$DAYS_TO_KEEP -name "*${FILE_SUFFIX}.gz" -exec rm -rf '{}' ';'
