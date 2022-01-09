FROM centos:centos7.7.1908
RUN #!/bin/bash
Run yum install yum-utils -y
RUN yum update -y
RUN rpm -Uvh https://archives.fedoraproject.org/pub/archive/epel/5/x86_64/gallery2-zipcart-2.3.2-1.el5.noarch.rpm;
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-5.rpm;
RUN yum install -y php7.2
RUN yum install -y  httpd 
RUN yum --enablerepo=remi,remi-php55 install php-pear
RUN pecl install pecl_http
RUN usermod -a -G apache ec2-user
RUN chown -R ec2-user:apache /var/www
RUN chmod 2775 /var/www
RUN find /var/www -type d -exec chmod 2775 {} \;
RUN find /var/www -type f -exec chmod 0664 {} \;

#Install git and MySQL extensions for PHP
COPY project /var/www/html/
EXPOSE 80/tcp
EXPOSE 443/tcp
RUN RUN cd /var/www/html
WORKDIR /var/www/html/
CMD [ "php" ,'./var/www/html/index.php' ]

