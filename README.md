Atlassian 서비스 구축을 위해 기존 MySQL 컨테이너를 개조하였습니다.

상속한 Dockerfile은 MySQL 5.7의 공식 Dockerfile입니다

https://github.com/docker-library/mysql

MySQL에 접속하는 방법은 3가지 방법으로 접속이 가능합니다.

컨테이너 내부에 있는 /etc/certs/ 에 있는 인증서를 이용한 접속 방법과

  ex) mysql -u sqluser  --ssl-ca=ca.pem --ssl-cert=client-cert.pem --ssl-key=client-key.pem -h 172.17.0.1

컨테이너 내부에서 mysql_root 라는 커맨드를 이용하여 접속하는 방법이 있습니다.

그리고 마지막으로 컨테이너 내부에서 그냥 empty 비번으로 접속하는 방법입니다

자세한 사항은 구성 파일을 참조하세요.
