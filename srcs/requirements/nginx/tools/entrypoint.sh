#!/bin/bash

mkdir /etc/nginx/ssl

chmod 755 /etc/nginx/ssl

KEY=/etc/nginx/ssl/habouiba.42.fr.key
CSR=/etc/nginx/ssl/habouiba.42.fr.csr
CRT=/etc/nginx/ssl/habouiba.42.fr.crt

openssl genrsa -out $KEY
openssl req -key $KEY -new -out $CSR <<EOF
MR
BG
BG
LEET
LEET
*.42.fr
email@email.com

1337
EOF
openssl req -x509 -in $CSR -key $KEY -out $CRT -days 365

exec "$@"
