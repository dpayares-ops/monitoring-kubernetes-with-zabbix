#!/bin/bash
set -ex

VERSION=$1
VERSION_ZABBIX_AGENT=$2
DATE=$3

echo $VERSION > zabbix-agent

touch /tmp/$VERSION.building

docker build -t zabbix-agent:$VERSION \
--build-arg VERSION_ZABBIX_AGENT=$VERSION_ZABBIX_AGENT \
--build-arg DATE=$DATE .

rm /tmp/$VERSION.building

rm zabbix-agent
