FROM debian:11.7-slim

EXPOSE 9000

RUN apt-get update

RUN apt-get install mariadb-client php-cgi php-common php-fpm php-mysql curl -y

RUN mkdir -p /var/www/html/adminer
RUN mkdir -p /run/php

RUN curl -fsSL https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/adminer/index.php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD [ "php-fpm7.4", "-F" ]
