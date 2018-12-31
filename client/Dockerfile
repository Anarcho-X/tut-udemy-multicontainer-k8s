FROM node:alpine as BuildPhase
WORKDIR /app
COPY ./package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx as RunPhase
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=BuildPhase /app/build /usr/share/nginx/html
