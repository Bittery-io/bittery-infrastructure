#!/bin/bash
source ./variables.sh
PWD=$(dirname "$0")

docker-compose -f ./docker-compose/docker-compose.common.yaml up -d
docker-compose -f ./docker-compose/docker-compose.wordpress.yaml up -d

### Generate nginx default.conf
echo 'Generating nginx default.conf'
sudo mkdir -p $PWD/volumes/nginx/conf
if [ $IS_DEVELOPMENT = 'true' ]; then
    sudo cp $PWD/templates/localhost/localhost.default.conf $PWD/volumes/nginx/conf/localhost.default.conf
else
    sudo cp $PWD/templates/prod/prod.default.conf $PWD/volumes/nginx/conf/prod.default.conf
    sudo cp $PWD/templates/prod/homepage.bittery.prod.conf $PWD/volumes/nginx/conf/bittery.prod.homepage.conf
    sudo cp $PWD/templates/prod/frontend.bittery.prod.conf $PWD/volumes/nginx/conf/frontend.prod.homepage.conf
fi
# Reload docker config
docker exec -t nginx sh -c 'nginx -s reload' 2>&1
###
