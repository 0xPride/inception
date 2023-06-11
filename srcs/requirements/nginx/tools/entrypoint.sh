#!/bin/bash

mkdir /etc/nginx/ssl

chmod 755 /etc/nginx/ssl

cat > /etc/nginx/csr.conf <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C = US
ST = California
L = San Fransisco
O = MLopsHub
OU = MlopsHub Dev
CN = habouiba.42.fr

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = demo.mlopshub.com
DNS.2 = www.demo.mlopshub.com
IP.1 = 192.168.1.5
IP.2 = 192.168.1.6

EOF

openssl genrsa -out /etc/nginx/ssl/habouiba.42.fr.key
openssl req -x509 -config /etc/nginx/csr.conf -key /etc/nginx/ssl/habouiba.42.fr.key -out /etc/nginx/ssl/habouiba.42.fr.crt -days 365

exec "$@"
