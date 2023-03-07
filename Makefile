all :
	@sudo mkdir -p /${HOME}/data/db
	@sudo mkdir -p /${HOME}/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build 
clean:
	@docker stop mariadb nginx wordpress
	@docker rm mariadb nginx wordpress
	@docker image rm srcs-nginx srcs-mariadb srcs-wordpress
	@sudo rm -rf /${HOME}/data/db /${HOME}/data/wordpress
	docker system prune -af
	docker volume rm srcs_DB srcs_WordPress