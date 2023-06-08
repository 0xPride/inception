#!/bin/bash
set -e
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql -e "UPDATE mysql.user SET Password = PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User = 'root'"

mysql -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Kill the anonymous users
mysql -e "DROP USER ''@'localhost'"

# mysql -e "DROP USER ''@'$(hostname)'"

mysql -e "DROP DATABASE test"

mysql -e "FLUSH PRIVILEGES"
