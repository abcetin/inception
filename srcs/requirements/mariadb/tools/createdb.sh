#!/bin/bash

chmod -R 755 /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -e "CREATE DATABASE ${DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;"
mysql -e "CREATE USER '${USER}' IDENTIFIED BY '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${USER}';"
mysql -e "FLUSH PRIVILEGES;"

# /usr/bin/mysqld_safe