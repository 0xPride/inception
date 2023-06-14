FROM alpine:3.18

RUN apk update

RUN apk add nginx openssl

EXPOSE 80

EXPOSE 443

COPY ./tools/entrypoint.sh /

RUN chmod 755 /entrypoint.sh

COPY ./conf/nginx.conf /etc/nginx/http.d/

ENTRYPOINT [ "sh", "/entrypoint.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]
