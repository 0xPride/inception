FROM alpine:3.18

EXPOSE 3306

RUN apk update
RUN apk add mysql mysql-client


RUN mkdir -p /var/log/mysql/
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /var/log/mysql
RUN chown -R mysql:mysql /run/mysqld
RUN chmod -R 770 /var/lib/mysql
COPY ./tools/entrypoint.sh .

RUN chmod 766 /entrypoint.sh

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["mysqld_safe", "--user=mysql", "--console"]
