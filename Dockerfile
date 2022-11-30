FROM node:15
COPY package.json .
RUN npm install
COPY . ./
EXPOSE 3000
CMD ["node", "server.js"]