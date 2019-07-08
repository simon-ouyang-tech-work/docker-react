FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
FROM nginx
# In the build phase, serve the application in the ngnix server
COPY --from=builder /app/build /usr/share/nginx/html