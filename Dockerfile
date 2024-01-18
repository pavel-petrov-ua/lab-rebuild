FROM node:latest

WORKDIR /app

COPY ./app/package*.json ./app/yarn.lock* ./
RUN npm install 

COPY ./app/process.json ./app/server.js ./
COPY ./app/* ./


EXPOSE 3000

CMD ["bash"]