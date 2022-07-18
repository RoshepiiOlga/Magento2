№FROM nginx:1.21.6-alpine
FROM nginx:1.18
RUN adduser -D -H -u 1005 -s /bin/bash -G www-data www-data
COPY nginx/config/templates/ /etc/nginx/templates/
