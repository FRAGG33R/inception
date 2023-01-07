CYAN = \033[0;36m

RESET = \033[0m
all:
	@echo "$(CYAN)\
		██╗███╗  ██╗ █████╗ ███████╗██████╗ ████████╗██╗ █████╗ ███╗  ██╗\n\
		██║████╗ ██║██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██║██╔══██╗████╗ ██║\n\
		██║██╔██╗██║██║  ╚═╝█████╗  ██████╔╝   ██║   ██║██║  ██║██╔██╗██║\n\
		██║██║╚████║██║  ██╗██╔══╝  ██╔═══╝    ██║   ██║██║  ██║██║╚████║\n\
		██║██║ ╚███║╚█████╔╝███████╗██║        ██║   ██║╚█████╔╝██║ ╚███║\n\
		╚═╝╚═╝  ╚══╝ ╚════╝ ╚══════╝╚═╝        ╚═╝   ╚═╝ ╚════╝ ╚═╝  ╚══╝\n $(RESET)"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:

	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:

	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re:

	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down

	@docker system prune -a


fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force


.PHONY	: all build down re clean fclean