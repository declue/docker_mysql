Atlassian 서비스 구축을 위해 기존 MySQL 컨테이너를 개조하였습니다.

참조한 Dockerfile은 MySQL 5.7의 공식 Dockerfile입니다

https://raw.githubusercontent.com/docker-library/mysql/26380f33a0fcd07dda35e37516eb24eaf962845c/5.7/Dockerfile

공식 이미지는 debian:stretch-slim에서 출발하지만 이 컨테이너는 declue/ubuntu:18.04를 기반으로 구성됩니다.

그리고 다음의 내용이 반영됩니다.

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
