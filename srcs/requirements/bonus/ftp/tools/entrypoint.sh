#!/bin/sh

# set -e

adduser ${FTP_USER} << EOF
${FTP_USER_PWD}
${FTP_USER_PWD}
EOF

mkdir -p /home/${FTP_USER}/ftp
mkdir -p /home/${FTP_USER}/ftp/files

chown nobody:nogroup -R /home/${FTP_USER}/ftp
chown ${FTP_USER}:${FTP_USER} -R /home/${FTP_USER}/ftp/files

chmod 555 /home/${FTP_USER}/ftp

echo "${FTP_USER}" | tee -a /etc/vsftpd/vsftpd.userlist

exec "$@"
