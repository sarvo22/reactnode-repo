FROM node:10
WORKDIR /react-app
COPY . .
RUN cd my-app/ && npm install && npm run build
RUN cd api/ && npm install
EXPOSE 3080
CMD ["node", "api/server.js"]