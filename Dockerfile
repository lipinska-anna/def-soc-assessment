FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

#CMD ["npm", "run", "start"]

FROM nginx:alpine
COPY --from=build /app/dist/def-soc-assessment /usr/share/nginx/html
EXPOSE 80
