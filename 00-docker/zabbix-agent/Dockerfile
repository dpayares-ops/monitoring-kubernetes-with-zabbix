
# sources

FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN apt-get update -qq && apt-get install apt-utils -qqy && apt-get dist-upgrade -qqy \
    && apt-get install -qqy  supervisor locales curl  procps \
    && apt-get autoremove --yes \
    && apt-get -qq clean \
    && rm -rf /var/lib/{apt,dpkg}/ 
   

ARG VERSION_ZABBIX_AGENT

ENV LANG en_US.utf8

RUN curl -o "${VERSION_ZABBIX_AGENT}"  https://repo.zabbix.com/zabbix/6.4/debian/pool/main/z/zabbix/zabbix-agent2_6.4.19-1%2Bdebian12_amd64.deb -s \
    && dpkg -i "${VERSION_ZABBIX_AGENT}" \
    && apt-get update \
    && rm -rf /tmp/* /var/tmp/* \ 
    && mkdir /var/run/zabbix/ \
    && chown -R zabbix:zabbix /var/run/zabbix/

COPY supervisord.conf /etc/supervisor/conf.d/docker.conf