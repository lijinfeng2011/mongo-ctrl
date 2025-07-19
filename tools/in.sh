#!/bin/bash

UUID=$1

if [ "X$UUID" == "X" ]; then
    echo "$0 UUID"
    exit 1
fi

PASSWORD=$(./password.sh $UUID)
echo password: $PASSWORD

#exec docker exec -it mongo-$UUID mongo -u root -p "$PASSWORD" --authenticationDatabase admin

exec docker exec -it mongo-$UUID mongosh -u root -p "$PASSWORD" --authenticationDatabase admin

