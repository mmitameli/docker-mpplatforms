FROM php:7.0-apache
RUN apt-get update -y

RUN apt-get install -y --no-install-recommends software-properties-common python-software-properties

RUN apt-get update -y

RUN apt-get install -y libfreetype6-dev libicu-dev libssl-dev libjpeg62-turbo-dev \
                       libmcrypt-dev libpng12-dev libedit-dev libedit2 libxslt1-dev \
                       libxml2-dev libpng-dev libjpeg-dev apt-utils mysql-client vim curl unzip

RUN apt-get clean

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/;
RUN docker-php-ext-install soap mysqli opcache gd bcmath intl mbstring mcrypt pdo_mysql xsl zip

RUN	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
RUN composer global require hirak/prestissimo

COPY ./config/php.ini /usr/local/etc/php/php.ini
RUN a2enmod rewrite
RUN service apache2 restart
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data
