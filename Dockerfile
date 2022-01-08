FROM php:7.3-cli

#Install  MySQL extensions for PHP

RUN #!/bin/bash
RUN docker-php-ext-install mysqli
RUN find /var/www -type d -exec chmod 2775 {} \;
RUN find /var/www -type f -exec chmod 0664 {} \;
RUN cd /var/www/html
RUN wget https://github.com/Abhishek98451/myNodeJsApp.git
WORKDIR /var/www/html/myNodeJsApp/
CMD [ "php" ,'project/index.php' ]
