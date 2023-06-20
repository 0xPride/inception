FROM debian:11.7-slim

EXPOSE 9000

RUN apt update
RUN apt-get install mariadb-client php-cgi php-common php-fpm php-pear php-mbstring \
  php-zip php-net-socket php-gd php-xml-util php-php-gettext php-mysql php-bcmath unzip curl git -y

RUN mkdir -p /var/www/html

COPY ./tools/entrypoint.sh /
RUN chmod 766 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "php-fpm7.4", "-F" ]
