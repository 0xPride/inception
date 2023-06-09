FROM debian:11.7-slim

RUN apt update
RUN apt-get install mariadb-client php-cgi php-common php-fpm php-pear php-mbstring \
  php-zip php-net-socket php-gd php-xml-util php-php-gettext php-mysql php-bcmath unzip wget git -y

EXPOSE 9000

COPY ./tools/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
