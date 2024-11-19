#!/bin/bash
set -ex

VERSION=$1
VERSION_ZABBIX_PROXY=$2
DATE=$3

echo $VERSION > zabbix-proxy

touch /tmp/$VERSION.building

docker build -t  localhost:5000/zabbix-proxy:$VERSION \
--build-arg VERSION_ZABBIX_PROXY=$VERSION_ZABBIX_PROXY \
--build-arg DATE=$DATE .

rm /tmp/$VERSION.building

rm zabbix-proxy
