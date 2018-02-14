FROM php:7.0-apache
RUN apt-get update -y
RUN apt-get install -y libxml2-dev libmcrypt-dev libpng-dev
RUN apt-get clean -y
RUN docker-php-ext-install soap mysqli mcrypt gd pdo pdo_mysql zip
COPY ./config/php.ini /usr/local/etc/php/php.ini
RUN a2enmod rewrite
RUN service apache2 restart
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data
