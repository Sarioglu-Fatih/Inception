DOCKER_COMPOSE		:=	docker-compose -f srcs/docker-compose.yml

VOLUMES			:=	$(shell docker volume ls -q)

all			:
	mkdir -p /home/fsariogl/data/mariadb/ /home/fsariogl/data/wordpress/
	${DOCKER_COMPOSE} up -d --build

clean			:
	${DOCKER_COMPOSE} down 

fclean			:	clean
	docker system prune -af --volumes
	docker volume rm $(VOLUMES)
	rm -rf /home/fsariogl/data/wordpress
	rm -rf /home/fsariogl/data/mariadb

re			:	fclean all

start			:
	docker-compose -f srcs/docker-compose.yml start

logs			:
	${DOCKER_COMPOSE} logs --timestamps

.PHONY			:	all clean fclean re start
