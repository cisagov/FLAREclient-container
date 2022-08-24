#!/usr/bin/env bash

mkdir certs && cd "$_"

keytool -genkey  -alias flareclient -storetype PKCS12 -keystore keystore.p12 -dname cn=flareclient -validity 3650 -storepass QWASZX23wesdxc -keypass QWASZX23wesdxc

# TODO: Consider using `jq` instead.
curl -s https://api.github.com/repos/cisagov/FLAREclient-container/releases/latest 2>&1 \
  | grep browser_download_url \
  | cut -d '"' -f 4 \
  | wget -qO - -i - \
  | docker image load --input -
