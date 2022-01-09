FROM centos:centos7.7.1908
RUN #!/bin/bash
Run yum install yum-utils -y
RUN yum update -y
RUN rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql
RUN rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm
RUN rpm -i http://rpms.famillecollet.com/enterprise/remi-release-5.rpm;
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

