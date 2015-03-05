#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

TST=1
while [[ TST -ne 0 ]]; do
    echo "=== Waiting for MariaDB Service to Start ==="
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    TST=$?
done


ADMINPASS=`< /dev/urandom tr -dc A-Za-z0-9 | head -c${1:-12};echo;`
echo "=== Creating Default Admin User ==="
mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '$ADMINPASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"

cat <<eof > /root/mariadb_credentials
========================================================================
MariaDB Credentials:

mysql -uadmin -p$ADMINPASS
========================================================================
eof
cat /root/mariadb_credentials
chmod 700 /root/mariadb_credentials
echo "=== Your credentials will be stored at /root/mariadb_credentials ==="
mysqladmin -uroot shutdown