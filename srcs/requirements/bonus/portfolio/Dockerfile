FROM debian:11.7-slim

WORKDIR /app

EXPOSE 3000

RUN apt-get update

RUN apt install curl -y

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&\
  apt-get install -y nodejs

COPY package.json .

RUN npm i

COPY . .

CMD ["npm", "run", "start"]