#!/bin/bash
PROJECT_HOME=`pwd`
exists=`docker ps --filter name=sqoop | wc -l`

if [ $exists -ne 2 ]; then
    echo "스쿱 컨테이너를 찾을 수 없습니다. - $exists"
    exit 0
fi

args=$@

if [ x"$args" == x"" ]; then
    echo "./sqoop.sh import -m 1 --connect jdbc:mysql://mysql:3306/testdb --username user --password pass --table seoul_popular_trip --target-dir /user/sqoop/seoul_popular_trip"
else
    echo "다음 명령을 수행합니다 - '$@'"
    docker exec -it sqoop sqoop $@
fi
