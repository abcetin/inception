all :
	@sudo mkdir -p /home/acetin/data/db
	@sudo mkdir -p /home/acetin/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build 
clean:
	@docker stop mariadb nginx wordpress
	@docker rm mariadb nginx wordpress
	@docker image rm srcs-nginx srcs-mariadb srcs-wordpress
	@sudo rm -rf /home/acetin/data/db /home/acetin/data/wordpress
	docker system prune -af
	docker volume rm srcs_DB srcs_WordPress