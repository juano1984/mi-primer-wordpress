FROM ubuntu:18.04
LABEL MAINTAINER="Juan Miguel Garcia Perez"
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && \
        apt-get install -y curl php libapache2-mod-php  php-mysql php-gd && \
        ln -sf /dev/stderr /var/log/apache2/error.log && \
        ln -sf /dev/stdout /var/log/apache2/access.log && \
        rm /var/www/html/index.html && \
        curl -s   https://wordpress.org/latest.tar.gz | tar -C /var/www/html/ -zx --strip-components=1 && \
        rm -rf /var/lib/apt/archives /var/cache/apt/archives && \
        chown -R www-data: /var/www/html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apachectl", "-D", "FOREGROUND"] 
