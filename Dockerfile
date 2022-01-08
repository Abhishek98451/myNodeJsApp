FROM php:7.3-cli

#Install git and MySQL extensions for PHP
COPY /myNodeJsApp/project/index.php ./src/
EXPOSE 80/tcp
EXPOSE 443/tcp
WORKDIR /var/www/html/
CMD [ "php" ,'./var/www/html/index.php' ]

