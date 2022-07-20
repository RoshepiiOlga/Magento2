#FROM nginx:1.21.6-alpine
FROM amatkovskiy/sigma_magento-nginx:1.21.3-alpine
#RUN adduser -D -H -u 1005 -s /bin/bash -G www-data www-data
COPY nginx/config/files/index.html / /etc/nginx/
COPY nginx/config/templates/ /etc/nginx/templates/
