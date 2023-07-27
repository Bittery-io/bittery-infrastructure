#!/bin/bash
###duplicated also in start-bittery-backend.sh but required for stop
export SSH_PRIV_KEY_PATH_ON_HOST=/homesome/path
export SSH_PRIV_KEY_PATH=/ssh/id_rsa
export LND_HOSTED_FILE_FOLDER_PATH=/lnd_hosted_files
###
docker-compose -f ../docker-compose/docker-compose.backend.yaml down
