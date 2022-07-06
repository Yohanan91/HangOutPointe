FROM node:alpine as builder
WORKDIR "/app"
ENV PATH /app/node_modules/.bin:$PATH
COPY Docker-React/package.json .
COPY Docker-React/package-lock.json .
RUN npm ci --silent
RUN npm install
COPY Docker-React .
CMD npm run start 

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]