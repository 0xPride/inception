all: fclean up

up: build
	$(shell docker compose -f ./srcs/docker-compose.yml up)

build:
	$(shell docker compose -f ./srcs/docker-compose.yml build)

down:
	$(shell docker compose -f ./srcs/docker-compose.yml down)

fclean: clean
	$(shell docker ps -aq | xargs docker stop | xargs docker rm)

clean:
	$(shell docker volume rm wordpress_vol)
	$(shell docker volume rm adminer_vol)
	rm -rf /home/habouiba/data
