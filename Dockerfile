FROM node:16-alpine@sha256:1298fd170c45954fec3d4d063437750f89802d72743816663664cfe9aa152b4b as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html