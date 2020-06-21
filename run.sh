#!/usr/bin/env bash

docker network create -d bridge ais20
docker rm -f humanreview-db
docker run \
    --network ais20 \
    -e MYSQL_USER="hr" \
    -e MYSQL_PASSWORD="hrDatabasePassword!@#$%" \
    --name humanreview-db \
    humanreview-db
