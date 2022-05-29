#Image Magento with all installing
FROM php:8.1-fpm-alpine3.14

RUN deluser www-data && adduser -u 1005 --disabled-password www-data 

RUN curl -sSLf \
        -o /usr/local/bin/install-php-extensions \
        https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd 

RUN install-php-extensions bcmath intl pdo_mysql soap sockets  xsl zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

COPY php-fpm/files/php.ini "$PHP_INI_DIR/php.ini"

COPY magento2 /var/www/html

# RUN chown -R www-data /var/www/html/
# RUN composer install
# RUN bin/magento setup:install \
#     --base-url=http://internship-sigma.pp.ua \
#     --db-host=magentodatabasemysql.cztnwxtfggr1.eu-west-1.rds.amazonaws.com \
#     --db-name=magentodb \
#     --db-user=admin \
#     --db-password=Fubr43hyqwerty \
#     --admin-firstname=admin \
#     --admin-lastname=admin \
#     --admin-email=roshepiyolga@gmail.com \
#     --admin-user=olga1 \
#     --admin-password=Qwerty1 \
#     --language=en_US \
#     --currency=USD \
#     --timezone=America/Chicago \
#     --use-rewrites=1 \
#     --search-engine=elasticsearch7 \
#     --elasticsearch-enable-auth=1 \
#     --elasticsearch-host=vpc-magento-elasticsearch-tafkusmqeabinijmckky7ljfvi.eu-west-1.es.amazonaws.com \
#     --elasticsearch-username=admin \
#     --elasticsearch-password="Qwerty123456!" \
#     --elasticsearch-port=443 \
#     --elasticsearch-index-prefix="admin.magento2"