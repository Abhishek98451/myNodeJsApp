FROM php:7.3-cli

#Install git and MySQL extensions for PHP

RUN apt-get update 
RUN docker-php-ext-install mysqli
RUN mkdir src
RUN mkdir src/myNodejsApp
WORKDIR /ec2-user/src/myNodejsApp
CMD [ "php" ,'./index.php' ]