all: 
	mkdir -p /home/brjoves/data/mariadb
	mkdir -p /home/brjoves/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	docker container stop nginx mariadb wordpress
	docker network rm inception
	docker compose -f ./srcs/docker-compose.yml down

fclean: clean
	@sudo rm -rf /home/brjoves/data/mariadb/*
	@sudo rm -rf /home/brjoves/data/wordpress/*
	@docker system prune -af

re: fclean all

.PHONY: all logs clean fclean