echo "mkdir /etc/certs"


if [  -d "/etc/certs" ]; then
	echo "/etc/certs is already exist"
	exit 0
fi

mkdir -p /etc/certs
cd /etc/certs

echo "gen ca-key.pem"
openssl genrsa 2048 > ca-key.pem

echo "gen ca.pem"
openssl req -new -x509 -nodes -days 3600 \
	-subj "${OPENSSL_CA}" \
	-key ca-key.pem -out ca.pem

echo "gen server-key.pem"
openssl req -newkey rsa:2048 -days 3600 -nodes \
	-subj "${OPENSSL_SERVER}" \
	-keyout server-key.pem -out server-req.pem

echo "gen server-req.pem"
openssl rsa -in server-key.pem -out server-key.pem

echo "gen server-cert.pem"
openssl x509 -req -in server-req.pem -days 3600 \
	-CA ca.pem -CAkey ca-key.pem -set_serial 01 -out server-cert.pem

echo "gen client-key.pem, client-req.pem"
openssl req -newkey rsa:2048 -days 3600 -nodes \
	-subj "${OPENSSL_CLIENT}" \
	-keyout client-key.pem -out client-req.pem

echo "gen client-key.pem"
openssl rsa -in client-key.pem -out client-key.pem

echo "gen client-cert.pem"
openssl x509 -req -in client-req.pem -days 3600 \
	-CA ca.pem -CAkey ca-key.pem -set_serial 01 -out client-cert.pem

echo "verify pem files.."
openssl verify -CAfile ca.pem server-cert.pem client-cert.pem

chown -R mysql:mysql /etc/certs/
chmod 600 client-key.pem server-key.pem ca-key.pem
