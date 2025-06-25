FROM php:8.1-apache
RUN docker-php-ext-install pdo_mysql

RUN apt-get update \
    && apt-get install -y libicu-dev \
    && apt-get install -y libxml2-dev \
    && apt-get install -y libevent-dev \
    && apt-get install -y libssl-dev \
    && apt-get install -y libpng-dev \
    && apt-get install -y libjpeg-dev \
    && apt-get install -y libfreetype6-dev \
    && apt-get install -y libzip-dev \
    && apt-get install -y zlib1g-dev \
    && apt-get install -y libpng-dev \
    && apt-get install -y libjpeg-dev \
    && apt-get install -y libfreetype6-dev \
    && docker-php-ext-configure gd --with-jpeg --with-freetype \
    && docker-php-ext-install intl soap pcntl ftp zip gd

# Install Composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"    