all: fclean up

up: build
	docker compose -f ./srcs/docker-compose.yml up

build:
	docker compose -f ./srcs/docker-compose.yml build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	-@docker volume rm srcs_wordpress_vol || true 2>&1 1>/dev/null
	-@docker volume rm srcs_adminer_vol || true 2>&1 1>/dev/null
