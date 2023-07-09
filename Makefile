all: up

up: build
	docker compose -f ./srcs/docker-compose.yml up

build:
	docker compose -f ./srcs/docker-compose.yml build

down:
	docker compose -f ./srcs/docker-compose.yml down

logs:
	docker compose -f ./srcs/docker-compose.yml logs 
