#!/usr/bin/env bash

mkdir certs && cd "$_"

keytool -genkey  -alias flareclient -storetype PKCS12 -keystore keystore.p12 -dname cn=flareclient -validity 3650 -storepass QWASZX23wesdxc -keypass QWASZX23wesdxc

# TODO: Consider using `jq` instead.
curl -s https://api.github.com/repos/cisagov/FLAREclient-container/releases/latest 2>&1 \
  | grep browser_download_url \
  | cut -d '"' -f 4 \
  | wget -qO - -i - \
  | docker image load --input -

# docker-compose up -d

####
# Windows/WSL
# Get IP of the Docker VM.
$wsl_ip = (wsl -d "docker-desktop" -- "ifconfig" "eth0" "|" "grep" "inet addr:").trim("").split(":").split()[2]
# # Bind local port to the Docker VM.
# netsh interface portproxy add v4tov4 listenport=8080 listenaddress=0.0.0.0 connectport=8080 connectaddress=$wsl_ip
# docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
