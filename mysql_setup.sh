#!/bin/bash
 
__mysql_start() {
    echo "Running the mysql_config function."
    /usr/bin/mysqld_safe --skip-grant & 
    sleep 10
}
 
__mysql_config() {
    mysqladmin -u root -p$1
    sleep 3
    command="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$1' WITH GRANT OPTION; FLUSH PRIVILEGES;" 
    echo $command
    mysql -uroot -p$1 -e $command 
    sleep 5
}

echo 'START mysqld'
__mysql_start $1

echo 'ROOT PASSWORD : '$1
echo 'CONFIG remote-access'
__mysql_config
echo 'DONE'
