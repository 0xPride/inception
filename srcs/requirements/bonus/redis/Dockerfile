FROM alpine:3.9

RUN apk update

RUN apk add redis

EXPOSE 6379

COPY ./conf/redis.conf /etc/redis.conf

CMD ["redis-server", "/etc/redis.conf", "--protected-mode", "no"]
