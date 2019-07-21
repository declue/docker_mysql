#!/bin/bash
CMD=
if [[ ! -z "$1" ]]; then
	CMD=' -e "'$1'"'
fi
SQL_CMD='mysql -u root --ssl-ca=/etc/certs/ca.pem --ssl-cert=/etc/certs/client-cert.pem --ssl-key=/etc/certs/client-key.pem'$CMD
eval $SQL_CMD
