## Development
FROM node:24.12.0-alpine AS dev
WORKDIR /app
COPY . .
EXPOSE 5174

## Production
FROM httpd:alpine AS prod
WORKDIR /usr/local/apache2/htdocs/
COPY --from=dev /app/dist .
EXPOSE 80