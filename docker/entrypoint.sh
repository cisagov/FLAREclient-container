#!/usr/bin/env bash

echo "[ ]  Starting service  ... "

# The below argument is necessary to pass through
#  the 'mysqld' command from the Dockerfile to the entrypoint script
container-entrypoint "$@"