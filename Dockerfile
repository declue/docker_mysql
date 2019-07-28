FROM mysql:5.7

MAINTAINER bkperio@gmail.com

# install packages
RUN apt-get update
RUN apt-get -y install vim net-tools

# mkdir root folder
RUN mkdir /mysql_setup

# for ssl
ENV OPENSSL_SUBJ="/C=KO/ST=Seoul/L=Seoul"
ENV OPENSSL_CA="${OPENSSL_SUBJ}/CN=mysql-CA"
ENV OPENSSL_SERVER="${OPENSSL_SUBJ}/CN=mysql-server"
ENV OPENSSL_CLIENT="${OPENSSL_SUBJ}/CN=mysql-client"
ADD ssl_setup.sh /mysql_setup/ssl_setup.sh
RUN chmod +x /mysql_setup/ssl_setup.sh

# for mysql
ADD mysqld.cnf /mysql_setup/mysqld.cnf
ADD mysql_setup.sh /mysql_setup/mysql_setup.sh
RUN chmod +x /mysql_setup/mysql_setup.sh

# for entrypoint
ADD entrypoint.sh /mysql_setup/entrypoint.sh
RUN chmod +x /mysql_setup/entrypoint.sh
ADD create_user.sql /docker-entrypoint-initdb.d/create_user.sql

ENTRYPOINT ["/mysql_setup/entrypoint.sh"]
CMD ["mysqld"]



