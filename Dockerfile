FROM qnib/alpn-rsyslog

# do all in one step
RUN apk upgrade --update \
 && apk add owncloud-sqlite nginx php-fpm nmap bc \
 && rm -rf /var/cache/apk/*
ENV NGINX_PHP_SERVER=localhost:9000 \
    NGINX_OC_SERVERNAME=192.168.99.100

ADD etc/nginx/nginx.conf /etc/nginx/
ADD etc/consul-templates/owncloud/owncloud.conf.ctmpl /etc/consul-templates/owncloud/
ADD etc/php/php-fpm.conf /etc/php/
ADD etc/ssl/nginx/owncloud.crt etc/ssl/nginx/owncloud.key /etc/ssl/nginx/
ADD etc/supervisord.d/php-fpm.ini \
    etc/supervisord.d/owncloud.ini \
    /etc/supervisord.d/
ENV OC_UID=1000
ADD opt/qnib/owncloud/bin/start.sh /opt/qnib/owncloud/bin/
ADD etc/owncloud/config.php /etc/owncloud/
#RUN curl -fsL https://github.com/COMU/libreonline-owncloud/releases/download/0.1.1/libreonline.tar.gz|tar xfz - -C /usr/share/webapps/owncloud/apps/ \
# && cd /usr/share/webapps/owncloud/apps/ \
# && curl -fso /tmp/171237-contactsplus.zip https://apps.owncloud.com/CONTENT/content-files/171237-contactsplus.zip \
# && unzip -q /tmp/171237-contactsplus.zip && rm -f /tmp/171237-contactsplus.zip \
# && curl -fso /tmp/170560-calendarplus.zip https://apps.owncloud.com/CONTENT/content-files/170560-calendarplus.zip \
# && unzip -q /tmp/170560-calendarplus.zip && rm -f /tmp/170560-calendarplus.zip \
# && curl -fso /tmp/170561-tasksplus.zip https://apps.owncloud.com/CONTENT/content-files/170561-tasksplus.zip \
# && unzip -q /tmp/170561-tasksplus.zip && rm -f /tmp/170561-tasksplus.zip
