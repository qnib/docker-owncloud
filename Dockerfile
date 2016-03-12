FROM qnib/alpn-syslog

# do all in one step
RUN apk upgrade --update && \
    apk add owncloud-sqlite nginx php-fpm nmap bc && \
    rm -rf /var/cache/apk/*
ENV NGINX_PHP_SERVER=localhost:9000 \
    NGINX_OC_SERVERNAME=192.168.99.100

ADD etc/nginx/nginx.conf /etc/nginx/
ADD etc/consul-templates/owncloud/owncloud.conf.ctmpl /etc/consul-templates/owncloud/
ADD etc/php/php-fpm.conf /etc/php/
ADD etc/ssl/nginx/owncloud.crt etc/ssl/nginx/owncloud.key /etc/ssl/nginx/
ADD etc/supervisord.d/nginx.ini \
    etc/supervisord.d/php-fpm.ini \
    etc/supervisord.d/owncloud.ini \
    /etc/supervisord.d/
