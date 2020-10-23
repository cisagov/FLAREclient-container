#!/usr/bin/env bash

docker network create -d bridge ais20
docker rm -f flareclient-db
docker run \
    --network ais20 \
    -e MONGODB_ADMIN_USERNAME="admin" \
    -e MONGODB_ADMIN_PASSWORD="QWASZX23wesdxc" \
    --name flareclient-db \
    -p 27017:27017 \
    flareclient-db