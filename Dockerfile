FROM centos:centos7.7.1908
RUN #!/bin/bash
Run yum install yum-utils -y
RUN yum update -y
RUN rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql
RUN rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm

RUN yum install -y  httpd 
RUN yum --enablerepo=remi,remi-php55 install -y php-pear

COPY project /var/www/html/
EXPOSE 80/tcp
EXPOSE 443/tcp
RUN RUN cd /var/www/html
WORKDIR /var/www/html/
CMD [ "php" ,'./var/www/html/index.php' ]

