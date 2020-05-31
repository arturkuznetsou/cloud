FROM node:14
WORKDIR .
COPY package*.json ./
RUN npm install -g
COPY . .
EXPOSE 8080
CMD [ "npm", "start" ]
