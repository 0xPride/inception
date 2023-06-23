FROM debian:11.7-slim

WORKDIR /app

EXPOSE 3000

RUN apt-get update

RUN apt-get install nodejs npm -y

COPY package.json .

RUN npm i

COPY . .

CMD ["npm", "run", "start"]
