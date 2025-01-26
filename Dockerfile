FROM centos:latest
MAINTAINER rajivshaky687@gmail.com
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
  zip \
 unzip
RUN yum install -y unzip
ADD kindle.zip  /var/www/html
WORKDIR /var/www/html
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/* .
RUN rm -rf __MACOSX markups-kindle kindle.zip
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80
