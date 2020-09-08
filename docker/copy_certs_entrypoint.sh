#!/usr/bin/env bash

#echo "[ ]  Copying secrets files  ... "
#if [ -d "${SECRETS_DIR}" ]
#then
#    echo "Directory ${SECRETS_DIR} exists."
#    cp ${SECRETS_DIR}* /var/opt/mysql_certs/ 2>/dev/null
#    echo "[+]  Done copying secrets files  ... "
#else
#    echo "Warning: Directory ${SECRETS_DIR} does not exists. This is ok if you are running this locally."
#fi


echo "[ ]  Starting service  ... "

# The below argument is necessary to pass through
#  the 'mysqld' command from the Dockerfile to the entrypoint script
container-entrypoint "$@"