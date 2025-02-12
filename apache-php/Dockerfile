FROM php:8.0-apache
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get upgrade -y
COPY index.php /var/www/html/ 
COPY insert.php /var/www/html/
COPY .env /var/www/html/
CMD ["apache2-foreground"]