#!/bin/sh

docker build --build-arg USE_DEV_CERTS=true -t flareclient-db . | tee .out
if [ -z "$(grep 'Successfully built' .out )" ]; then echo "Error with docker build"; exit; fi
