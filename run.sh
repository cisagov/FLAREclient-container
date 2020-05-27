#!/usr/bin/env bash

docker build --build-arg USE_DEV_CERTS=true -t hr-db .
docker run \
    -e MYSQL_USER=hr \
    -e MYSQL_PASSWORD="hrDatabasePassword!@#$%" \
    hr-db
