FROM node:latest

COPY ./app/package*.json ./

RUN npm install 

COPY ./app/* ./

EXPOSE 3000

CMD ["sh", "start"]