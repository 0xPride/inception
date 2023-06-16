#!/bin/bash

set -e

WP=/var/www/html/habouiba.42.fr/

chown -R www-data:www-data /var/www/html/

if [ ! -d "${WP}" ]; then
  # installing wp-cli
  cd opt;
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp

  # installing wordpress
  wp core download --allow-root --path=${WP} --locale=en_US
  cd ${WP}
  wp config create --allow-root \
    --dbname=${WP_DB} \
    --dbuser=${WP_DB_USR} \
    --dbpass=${WP_PWD} \
    --dbhost=${DB_HOSTNAME}
  wp db create

fi

mkdir -p /run/php/
chown www-data:www-data /run/php
exec "$@"
