#!/usr/bin/env bash

mkdir certs && cd "$_"

openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes -subj /CN=ais-client

openssl pkcs12 -export -in cert.pem -inkey key.pem -out ais-client-store.p12 -name "AIS Client Certificate"

# TODO: Consider using `jq` instead.
curl -s https://api.github.com/repos/cisagov/FLAREclient-container/releases/latest 2>&1 \
  | grep browser_download_url \
  | cut -d '"' -f 4 \
  | wget -qO - -i - \
  | docker import - ais-client:latest


# docker-compose up -d

# docker-compose down