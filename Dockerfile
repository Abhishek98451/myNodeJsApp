FROM centos:centos7.7.1908
RUN #!/bin/bash
Run yum install yum-utils -y
RUN yum update -y
#my sql 
RUN rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql
#noareach packge download and php packge
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
#install httpd and php 8
RUN yum install -y  httpd 
RUN yum --enablerepo=remi,remi-php55 install -y php-pear
#copy index.php , folder assets and vendor
COPY project /var/www/html/
#Enable port 80 and 443 for appace and php
EXPOSE 80/tcp
EXPOSE 443/tcp
#change directory
RUN cd /var/www/html
#File Store directory
WORKDIR /var/www/html/
#Open File
CMD [ "php" ,'.index.php' ]
