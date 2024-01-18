FROM node:latest

WORKDIR /app1

COPY ./app/package*.json ./

RUN npm install 

COPY ./app/* ./

EXPOSE 3000

CMD ["sh"]