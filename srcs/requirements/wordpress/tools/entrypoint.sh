#!/bin/bash

MY_DOMAIN = $HOST.42.fr

mkdir -p /var/www/html
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.gz
mv wordpress $MY_DOMAIN
cp wp-config-sample.php wp-config.php

sed -i "s/wpuser/${MYSQL_USER}" wp-config.php
sed -i "s/dbpassword/${MYSQL_PASSWORD}" wp-config.php
sed -i "s/localhost/${DB_HOSTNAME}" wp-config.php

chown -R www-data:www-data /var/www/html/wordpress

exec "$@"
