#!/usr/bin/env bash

mkdir certs && cd "$_"

keytool -genkey  -alias flareclient -storetype PKCS12 -keystore keystore.p12 -dname cn=flareclient -validity 3650 -storepass QWASZX23wesdxc -keypass QWASZX23wesdxc

# TODO: Consider using `jq` instead.
curl -s https://api.github.com/repos/cisagov/FLAREclient-container/releases/latest 2>&1 \
  | grep browser_download_url \
  | cut -d '"' -f 4 \
  | wget -qO - -i - \
  | docker image load --input -


####
# Credentials from decompilation:
# admin:12qwaszx@#WESDXC
# ssl:
#   key-store: src/main/resources/demouser_ks.jks
#   key-store-password: 12qwaszx@#WESDXC
#   key-store-provider: SUN
#   key-store-type: JKS
#   trust-store: src/main/resources/ca.jks
#   trust-store-password: 12qwaszx@#WESDXC
#   keyAlias: demouser


####
# Mongo
# mongo mongodb://127.0.0.1:27017
# > use flareclient
# > db.getCollectionNames().forEach(c => {
# ...     db[c].find().forEach(d => {
# ...         print(c);
# ...         printjson(d)
# ...     })
# ... })
# # Set the admin password to password.
# > db.user.update({"_id": "user-2"},{$set:{"password": "$2a$10$9YhJwhBbRyP3nYMguxlzh.qcQ4AK/RyBPUIz7gE/PdLHaIbWXhHKq"}})

