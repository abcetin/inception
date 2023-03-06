FROM debian:buster

RUN apt-get -y update; \
	apt-get -y install mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/createdb.sh /


RUN chmod -R 755 /etc/mysql/mariadb.conf.d/50-server.cnf; \
service mysql start

CMD bash 'createdb.sh'; 'bash'
