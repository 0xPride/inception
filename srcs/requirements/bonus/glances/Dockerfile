FROM debian:11.7-slim

EXPOSE 61208

RUN apt update && apt install curl -y

RUN curl -L https://bit.ly/glances | /bin/bash

CMD ["glances", "-w"]
