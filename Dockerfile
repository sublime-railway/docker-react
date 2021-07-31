FROM node:alpine

WORKDIR /app
COPY ./package.json ./
RUN npm install

COPY ./ ./ 
RUN npm run build
 
FROM nginx
EXPOSE 80
COPY ./nginx/default.conf /etc/ngnx/conf.d/default.conf
COPY --from=0 /app/build /usr/share/nginx/html