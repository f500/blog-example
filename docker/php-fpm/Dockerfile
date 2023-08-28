FROM php:8.1-fpm-alpine

RUN apk add --no-cache bash

RUN apk add --no-cache --virtual  \
        .build-dependencies \
        autoconf \
        g++ \
        make \
        icu-dev

RUN docker-php-ext-install pcntl
RUN docker-php-ext-install posix
RUN docker-php-ext-install intl

RUN pecl install xdebug-3.1.2
RUN docker-php-ext-enable xdebug
COPY xdebug.ini ${PHP_INI_DIR}/conf.d/xdebug.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

VOLUME /opt/project
WORKDIR /opt/project
