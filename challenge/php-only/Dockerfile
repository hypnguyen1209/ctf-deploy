FROM php:fpm-alpine

RUN apk add --update --no-cache supervisor nginx \
    && rm -rf /tmp/* 

#RUN docker-php-ext-install xnxx && docker-php-ext-enable xnxx 

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

COPY config/fpm.conf /usr/local/etc/php-fpm.d/www-data.conf

COPY config/supervisord.conf /etc/supervisord.conf

COPY config/nginx.conf /etc/nginx/nginx.conf

RUN chown -R www-data:www-data /var/lib/nginx

CMD /usr/bin/supervisord -c /etc/supervisord.conf