FROM alpine:3

EXPOSE 3306

COPY ./tools/entrypoint.sh .
RUN chmod 766 /entrypoint.sh

RUN apk update
RUN apk add mysql mysql-client

VOLUME /var/log/mysql

# RUN chown mysql:mysql /var/lib/mysql

# ENTRYPOINT ["sh", "/entrypoint.sh"]
