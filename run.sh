#!/usr/bin/env bash

docker network create -d bridge ais20
docker rm -f flareclient-db
docker run \
    --network ais20 \
    --name flareclient-db \
    -p 27017:27017 \
    flareclient-db