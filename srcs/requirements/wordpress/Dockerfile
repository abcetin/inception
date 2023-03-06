FROM debian:buster

RUN apt-get update; \
	apt-get install -y php7.3 php-mysqli php-fpm mariadb-client

RUN	apt-get install curl -y; \ 
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	chmod +x wp-cli.phar; \
	mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY tools/createwp.sh /


CMD bash 'createwp.sh'; 'bash'