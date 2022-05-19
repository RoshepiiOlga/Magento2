#FROM magento_sigma_magento-php_fpm
FROM php:8.1-fpm-alpine3.14
COPY ./magento2 /var/www/html