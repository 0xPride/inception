#!/bin/bash

set -e

WP=/var/www/html/habouiba.42.fr/

chown -R www-data:www-data /var/www/html/

sed -i "s/wpuser/${MYSQL_USER}/" ${WP}wp-config.php
sed -i "s/dbpassword/${MYSQL_PASSWORD}/" ${WP}wp-config.php
sed -i "s/localhost/${DB_HOSTNAME}/" ${WP}wp-config.php


mkdir /run/php/
chown www-data:www-data /run/php
exec "$@"
