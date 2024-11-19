#!/bin/bash
set -ex

NAME=zabbix-proxy
VERSION=6.4.19
VERSION_ZABBIX_PROXY=zabbix-proxy-sqlite3_6.4.19-1-debian12_amd64.deb
DATE=$(date +%Y-%m-%d-%H:%M)


PUSH=TRUE
LATEST=TRUE

# run build
./build.sh $VERSION $VERSION_ZABBIX_PROXY $DATE

#tag version
if [ $PUSH = "TRUE" ]; then
  docker push  localhost:5000/$NAME:$VERSION
fi

#push 
if [ $LATEST = "TRUE" ]; then
  docker tag  localhost:5000/$NAME:$VERSION \
     localhost:5000/$NAME:latest

  docker push  localhost:5000/$NAME:latest
fi


#clean dockers images
if ! ls /tmp/*.building 1> /dev/null 2>&1; then
  docker image prune --filter="dangling=true" -f
fi
