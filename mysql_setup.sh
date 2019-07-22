#!/bin/bash

if [ -f '/mysql_setup/mysqld.cnf' ]; then
	echo "init mysqld.conf"
	mv /mysql_setup/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
fi
