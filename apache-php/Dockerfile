# FROM php:8.0-apache
# RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
# RUN apt-get update && apt-get upgrade -y
# COPY index.php /var/www/html/ 
# COPY insert.php /var/www/html/
# COPY .env /var/www/html/
# CMD ["apache2-foreground"]

# Project that can help us to deploy CICD
#https://gist.github.com/jcavat/2ed51c6371b9b488d6a940ba1049189b

# Stage 1: Build the vendor folder
FROM composer:2 as vendor

WORKDIR /app

# Copy only composer files to install dependencies
COPY composer.json composer.lock ./

# Install dependencies (no dev dependencies)
RUN composer update

# Stage 2: Build the final PHP image
FROM php:8.2-apache

WORKDIR /var/www/html

# RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN apt-get update && apt-get upgrade -y
# Copy only the necessary files from the vendor stage
COPY --from=vendor /app/vendor ./vendor

# Copy the rest of the application code
COPY . .

RUN mkdir /data

COPY . /data
# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]