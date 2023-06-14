#!/bin/bash

set -e

WP=/var/www/html/habouiba.42.fr/

chown -R www-data:www-data /var/www/html/

sed -i "s/database_name_here/${WP_DB}/" ${WP}wp-config.php
sed -i "s/username_here/${WP_DB_USR}/" ${WP}wp-config.php
sed -i "s/password_here/${WP_DB_PWD_USR}/" ${WP}wp-config.php
sed -i "s/localhost/${DB_HOSTNAME}/" ${WP}wp-config.php

mkdir /run/php/
chown www-data:www-data /run/php
exec "$@"
