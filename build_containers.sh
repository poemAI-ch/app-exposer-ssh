#! /bin/bash

# get scripts dir
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${SCRIPT_DIR}/inside_container
docker build -t app-exposer-ssh-inside:local .

cd ${SCRIPT_DIR}/outside_container
docker build -t app-exposer-ssh-outside:local .
