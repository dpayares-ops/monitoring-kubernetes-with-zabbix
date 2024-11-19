#!/bin/bash
set -ex

TAG=${1}

#change tag push var value
sed -i "s/=TRUE/=FALSE/" release.sh

#commit to git
echo $TAG > VERSION.zabbix-proxy

git commit -am v$TAG
git tag -a v$TAG -m 'version '$TAG
git push
git push origin v$TAG
