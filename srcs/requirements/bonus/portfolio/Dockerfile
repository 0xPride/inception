FROM alpine:3.18

WORKDIR /app

EXPOSE 3000

RUN apk update

RUN apk add nodejs npm

COPY package.json .

RUN npm i

COPY . .

CMD ["npm", "run", "start"]
