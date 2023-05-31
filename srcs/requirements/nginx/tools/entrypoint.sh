#!/bin/bash

mkdir /etc/nginx/ssl

chmod 755 /etc/nginx/ssl

openssl genrsa -out /etc/nginx/ssl/habouiba.fr.key
openssl req -x509 -config /etc/nginx/csr.conf -key /etc/nginx/ssl/habouiba.fr.key -out /etc/nginx/ssl/habouiba.fr.crt -days 365

exec "$@"
