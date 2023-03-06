#!/bin/bash

cd /var/www/html

wp core download --allow-root

wp config create --allow-root --dbname=${DB_NAME} --dbuser=${USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST} --dbcharset=utf8

wp core install --url=https://acetin.42.fr --title='Abdullah ÇETİN' --admin_user=${USER} --admin_email=${ADMIN_EMAIL} --admin_password=${ADMIN_PASS} --allow-root


wp theme install microtype --activate --allow-root
wp user create ftuncer ftuncer@42.fr --role=editor --first_name=furkan --last_name=tuncer --user_pass=furki --allow-root
wp db optimize --allow-root


service php7.3-fpm start
