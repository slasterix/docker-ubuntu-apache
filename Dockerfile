FROM slasterix/docker-ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get install -y apache2 cronolog build-essential git apache2-dev && \
  mkdir -p /var/lock/apache2 && mkdir -p /var/run/apache2 && \
  chmod -R 777 /var/log/apache2 /var/lock/apache2 /var/run/apache2 \
                /etc/apache2/sites-* /etc/apache2/mods-* /etc/apache2/conf-* \
                /var/www && \
  chmod 666 /etc/apache2/ports.conf && \
  a2enmod rewrite ssl headers cgi mpm_prefork include && \
  apt-get -y autoremove build-essential apache2-dev git && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 80 443
