#!/bin/bash

/mysql_setup/ssl_setup.sh
/mysql_setup/mysql_setup.sh

exec /entrypoint.sh "$@"
