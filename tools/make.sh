#!/bin/bash

VERSION=$1
UUID=$2

if [ "X$UUID" == "X" ]; then
    echo "$0 version UUID"
    exit 1
fi

mkdir -p /data/mongo/$UUID/data
cp ../mongo-$VERSION/* /data/mongo/$UUID/

# 替换 UUID 和 PORT
sed -i "s/_UUID_/$UUID/" /data/mongo/$UUID/docker-compose.yaml

PORT=$(echo 27017 + $UUID - 1 | bc)
echo PORT: $PORT
sed -i "s/_PORT_/$PORT/" /data/mongo/$UUID/docker-compose.yaml

PASSWORD=$(< /dev/urandom tr -dc A-Za-z0-9 | head -c12; echo)
sed -i "s/_PASSWORD_/$PASSWORD/" /data/mongo/$UUID/docker-compose.yaml

