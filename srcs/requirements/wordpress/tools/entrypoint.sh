#!/bin/bash

set -e

WP=/var/www/html/habouiba.42.fr/

chown -R www-data:www-data /var/www/html/

if [ ! -f "${WP}index.php" ]; then
  wp core download --allow-root --path=/var/www/html/habouiba.42.fr --locale=en_US
fi

if [ ! -f "${WP}wp-config.php" ]; then
  wp config create --allow-root \
    --dbname=${WP_DB} \
    --dbuser=${WP_DB_USR} \
    --dbpass=${WP_DB_PWD} \
    --dbhost=${DB_HOSTNAME}

  wp core --allow-root install --url=${DOMAIN_NAME} --title=${WP_TITILE} --admin_user=${WP_DB_USR} --admin_password=${WP_DB_PWD} --admin_email=${WP_EMAIL}

  wp config set WP_REDIS_SCHEME tcp --allow-root
  wp config set WP_REDIS_PASSWORD foobared --allow-root
  wp plugin install redis-cache --activate --allow-root

  wp config --allow-root set WP_REDIS_HOST "redis"
  wp config --allow-root set WP_REDIS_PORT "6379"
  wp config --allow-root set WP_REDIS_DATABASE "15"
  wp redis enable --allow-root
fi

mkdir -p /run/php/
chown www-data:www-data /run/php
chown -R www-data:www-data /var/www/html/
exec "$@"
