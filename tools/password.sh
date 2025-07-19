#!/bin/bash

UUID=$1

if [ "X$UUID" == "X" ]; then
    echo "$0 UUID"
    exit 1
fi

grep MONGO_INITDB_ROOT_PASSWORD /data/mongo/$UUID/docker-compose.yaml | awk '{print $2}'

