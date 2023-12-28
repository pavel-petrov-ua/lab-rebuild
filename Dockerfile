FROM node:latest

WORKDIR /app1

COPY ./app/package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]