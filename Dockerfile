FROM php:7.3-cli

#Install git and MySQL extensions for PHP
COPY ./var/www/html/index.php ./home/ec2-user/src/
EXPOSE 80/tcp
EXPOSE 443/tcp
WORKDIR /ec2-user/src/myNodejs
CMD [ "php" ,'./project/index.php' ]

