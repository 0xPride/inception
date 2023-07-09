FROM debian:11.7-slim

WORKDIR /var/www/html/habouiba.42.fr

EXPOSE 9000

RUN apt update
RUN apt-get install mariadb-client php-cgi php-common php-fpm php-pear php-mbstring \
  php-zip php-net-socket php-gd php-xml-util php-php-gettext php-mysql php-bcmath unzip curl git -y

RUN mkdir -p /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/entrypoint.sh /
RUN chmod 766 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "php-fpm7.4", "-F" ]
