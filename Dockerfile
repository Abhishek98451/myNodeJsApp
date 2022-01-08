FROM centos:7.7

#Install git and MySQL extensions for PHP
RUN #!/bin/bash
RUN yum install yum-utils
RUN yum update -y 
RUN amazon-linux-extras install -y php7.2
RUN yum install -y httpd
RUN systemctl start httpd
RUN systemctl enable httpd
RUN usermod -a -G apache ec2-user
RUN chown -R ec2-user:apache /var/www
RUN chmod 2775 /var/www
RUN find /var/www -type d -exec chmod 2775 {} \;
RUN find /var/www -type f -exec chmod 0664 {} \;
RUN cd /var/www/html
RUN git clone https://github.com/Abhishek98451/myNodeJsApp.git
WORKDIR /var/www/html/myNodeJsApp/
CMD [ "php" ,'project/index.php' ]
