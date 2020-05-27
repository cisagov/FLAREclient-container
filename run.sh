#!/usr/bin/env bash

docker build --build-arg USE_DEV_CERTS=true -t hr-db .
docker network create -d bridge ais20
docker run \
    --network ais20 \
    -e MYSQL_USER=hr \
    -e MYSQL_PASSWORD="hrDatabasePassword!@#$%" \
    --name hr-db \
    hr-db
