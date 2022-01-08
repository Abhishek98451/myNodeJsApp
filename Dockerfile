FROM php:7.3-cli

#Install git and MySQL extensions for PHP
RUN docker-php-ext-install mysqli
COPY  index.php ./ec2-user/src/myNodejs
COPY src /var/www/html/
EXPOSE 80/tcp
EXPOSE 443/tcp
WORKDIR /ec2-user/src/myNodejs
CMD [ "php" ,'./project/index.php' ]
