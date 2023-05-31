FROM alpine:3

RUN apk update

RUN apk add nginx openssl

EXPOSE 80

EXPOSE 443

COPY ./tools/entrypoint.sh /

RUN chmod 755 /entrypoint.sh

ENTRYPOINT [ "sh", "/entrypoint.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]
