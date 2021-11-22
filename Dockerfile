#stage 1
FROM node:latest as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=build /app/dist/docker-angular-starter-pack /usr/share/nginx/html
