FROM mysql:5.7

MAINTAINER bkperio@gmail.com

ARG ROOT_PASSWORD=changeit
ENV MYSQL_ROOT_PASSWORD=${ROOT_PASSWORD}

COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY mysql_setup.sh /root/mysql_setup.sh

RUN /root/mysql_setup.sh $ROOT_PASSWORD > /root/log


