#!/bin/bash

set -f

mysql_start() {
    echo "Running the mysql_config function."
    #mysqld_safe --skip-grant &
    /etc/init.d/mysql start
}

mysql_user_config() {
    command='CREATE USER "sqluser"@"%" IDENTIFIED BY "'$1'" REQUIRE SSL; GRANT ALL PRIVILEGES ON *.* TO "sqluser"@"%" IDENTIFIED BY "'$1'" REQUIRE SSL; FLUSH PRIVILEGES;'
    echo $command
    mysql -uroot -p$1 -e "$command"
}


echo 'START mysqld'
mysql_start
mysql_user_config $1
echo 'DONE'
