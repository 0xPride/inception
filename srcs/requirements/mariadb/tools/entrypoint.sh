#!/bin/sh
set -e

# Switch to mariadbuser
su -s /bin/sh -c "/usr/bin/mysqld" mariadbuser

