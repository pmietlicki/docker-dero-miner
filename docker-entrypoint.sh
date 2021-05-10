#!/bin/sh
set -ex
if [ -f "/home/dero/config/config.json" ]
then
./xmrig --config /home/dero/config/config.json
else
./xmrig --url=${POOL_URL} --user=${POOL_USER} --pass=${POOL_PW} -k --coin=${COIN}
fi
exec "$@"
