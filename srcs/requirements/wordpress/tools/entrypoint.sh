#!/bin/bash

set -e

WP=/var/www/html/habouiba.42.fr/

chown -R www-data:www-data /var/www/html/

if [ ! -f "${WP}index.php" ]; then
  # installing wp-cli
  mkdir -p ${WP}
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
  wp db --allow-root create
  wp db --allow-root query "GRANT ALL PRIVILEGES on ${WP_DB}.* TO \'${WP_DB_USR}\'@'%' IDENTIFIED BY \'${WP_PWD}\';"
  wp db --allow-root query "FLUSH PRIVILEGES;"
  
  wp plugin install --allow-root redis-cache --active
  wp config --allow-root set WP_REDIS_HOST "redis"
  wp config --allow-root set WP_REDIS_PORT "6379"
  wp config --allow-root set WP_REDIS_DATABASE "15"

fi

mkdir -p /run/php/
chown www-data:www-data /run/php
exec "$@"
