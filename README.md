Atlassian 서비스 구축을 위해 기존 MySQL 컨테이너를 개조하였습니다.

상속한 Dockerfile은 MySQL 5.7의 공식 Dockerfile입니다

https://github.com/docker-library/mysql

그리고 다음의 내용이 추가 반영됩니다.

```
[mysqld]
default-storage-engine=INNODB
character_set_server=utf8mb4
innodb_default_row_format=DYNAMIC
innodb_large_prefix=ON
innodb_file_format=Barracuda
innodb_log_file_size=2G
sql_mode = NO_AUTO_VALUE_ON_ZERO <- 제거
```
