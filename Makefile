all:
	$(shell docker-compose -f ./srcs/docker-compose.yml up)

fclean: clean
	$(shell docker ps -aq | xargs docker stop | xargs docker rm )
clean:
	$(shell docker images -q | xargs docker rmi)
