FROM alpine:3.18

EXPOSE 3306

COPY ./tools/entrypoint.sh .
RUN chmod 766 /entrypoint.sh

RUN apk update
RUN apk add mysql mysql-client

# VOLUME /var/log/mysql

RUN mkdir /var/log/mysql/
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /var/log/mysql

ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["sh"]
# CMD ["mysqld_safe"]
