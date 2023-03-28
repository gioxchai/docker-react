FROM node:16-alpine as builder

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# copy from another build to nginx default html dir
COPY --from=builder /app/build /usr/share/nginx/html

# nginx starts itself from this image

