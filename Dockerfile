FROM node:16-alpine

WORKDIR '/app'
COPY package*.json /
RUN npm ci
COPY . .

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

# CMD ["node", "app.js"]