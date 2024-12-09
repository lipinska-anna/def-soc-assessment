FROM node:20-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

#CMD ["npm", "run", "start"]

FROM nginx:alpine
RUN rm /usr/share/nginx/html/*
COPY --from=build /app/dist/def-soc-assessment/browser /usr/share/nginx/html
EXPOSE 4200

CMD ["nginx", "-g", "daemon off;"]
