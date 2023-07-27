#!/bin/bash
docker-compose -f ./docker-compose/docker-compose.wordpress.yaml down
docker-compose -f ./docker-compose/docker-compose.common.yaml down
