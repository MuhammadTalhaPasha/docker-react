# this is a docker file with multi-step build process having two base images
#image 1
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#image 2
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
