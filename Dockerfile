FROM mysql:5.7

MAINTAINER bkperio@gmail.com

COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY mysql_setup.sh /root/mysql_setup.sh

RUN /root/mysql_setup.sh

ENV MYSQL_ROOT_PASSWORD dlatlqlqjs

