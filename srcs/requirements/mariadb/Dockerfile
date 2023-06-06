FROM alpine:3

EXPOSE 3306

COPY ./tools/entrypoint.sh /

RUN apk update

RUN apk add mariadb

RUN chmod 766 /entrypoint.sh

RUN adduser -D -s /sbin/nologin mariadbuser

RUN chown -R mariadbuser:mariadbuser /var/lib/mysql
RUN chown -R mariadbuser:mariadbuser /var/log/mariadb
RUN chmod -R 700 /var/lib/mysql
RUN chmod -R 700 /var/log/mariadb


ENTRYPOINT [ "/entrypoint.sh" ]

# CMD ["mysqld"]
