FROM mysql:5.7

MAINTAINER bkperio@gmail.com

ARG ROOT_PASSWORD=changeit
ARG ROOT_HOST=%
ENV MYSQL_ROOT_PASSWORD=${ROOT_PASSWORD}
ENV MYSQL_ROOT_HOST=${ROOT_HOST}

# default packages
RUN apt-get update
RUN apt-get install -y openssl vim net-tools

WORKDIR /root

# for SSL
ENV OPENSSL_SUBJ="/C=KO/ST=Seoul/L=Seoul"
ENV OPENSSL_CA="${OPENSSL_SUBJ}/CN=mysql-CA"
ENV OPENSSL_SERVER="${OPENSSL_SUBJ}/CN=mysql-server"
ENV OPENSSL_CLIENT="${OPENSSL_SUBJ}/CN=mysql-client"
COPY ssl_setup.sh /root/ssl_setup.sh
RUN chmod +x /root/ssl_setup.sh
RUN /root/ssl_setup.sh

# mysql config
COPY mysql_setup.sh /root/mysql_setup.sh
RUN  /root/mysql_setup.sh $ROOT_PASSWORD $ROOT_HOST >> /root/init.log

COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# for root
COPY mysql_root.sh /usr/local/bin/mysql_root
RUN chmod +x /usr/local/bin/mysql_root

