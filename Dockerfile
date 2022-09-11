FROM node:lts-alpine

RUN npm install -g http-server

WORKDIR /src

COPY ["src/package.json", "src/package-lock.json", "./"]

RUN npm install

COPY ["./src", "./"]

RUN npm run build

EXPOSE 3001

CMD [ "http-server", "-p 3001","dist"]