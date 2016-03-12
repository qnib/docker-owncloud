#!/bin/bash

adduser -h /var/lib/owncloud/data/ -s /sbin/nologin -u ${OC_UID} -D owncloud
mkdir -p /var/log/owncloud

chown owncloud: /var/log/owncloud

chown -R owncloud: /etc/owncloud/
# Data
mkdir -p /data/owncloud/
chown -R owncloud: /data/owncloud/ /usr/share/webapps/owncloud/config /usr/share/webapps/owncloud/apps/ 

consul-template -consul localhost:8500 -once -template "/etc/consul-templates/owncloud/owncloud.conf.ctmpl:/etc/nginx/conf.d/owncloud.conf"


nginx

