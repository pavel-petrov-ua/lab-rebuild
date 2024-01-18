FROM node:latest

WORKDIR /app

COPY ./app/package*.json ./app/yarn.lock* ./
COPY ./app/process.json ./app/server.js ./
COPY ./app/* ./

RUN npm install 
RUN npm audit fix --force

EXPOSE 3000

CMD ["npm", "start"]