all:
	$(shell docker-compose -f ./srcs/docker-compose.yml up)
