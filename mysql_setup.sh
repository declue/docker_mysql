#!/bin/bash
 
__mysql_config() {
    echo "Running the mysql_config function."
    /usr/bin/mysqld_safe & 
    sleep 10
}
 
__start_mysql() {
    mysqladmin -u root password dlatlqlqjs
    mysql -uroot -pfoobar -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'dlatlqlqjs' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    sleep 10
}
 
__mysql_config
__start_mysql
