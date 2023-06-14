#!/bin/bash
set -e

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null


mariadbsetup=$(mktemp)
cat <<EOF >mariadbsetup
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE IF NOT EXISTS $WP_DB CHARACTER SET = 'utf8' COLLATE = 'utf8_general_ci';
CREATE USER IF NOT EXISTS '$WP_DB_USR'@'%' IDENTIFIED by '$WP_DB_PWD';
GRANT ALL PRIVILEGES ON $WP_DB.* TO '$WP_DB_USR'@'%';
FLUSH PRIVILEGES;
EOF
mysqld --user=mysql --bootstrap < mariadbsetup
rm mariadbsetup

# The following command will configure the server to accept all incoming connections. This should only be done for development, or
# if the database is not exposed to the Internet or a sensitive network.

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec "$@"
