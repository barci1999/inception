GREEN=\033[0;32m
NC=\033[0m

DATA_DIR=/home/${USER}/data

all:up

up:
	@echo "$(GREEN)levantando contenedores$(NC)"
	docker compose -f src/docker-compose.yml up -d --build
down:
	@echo "$(GREEN)Deteniendo contenerdores$(NC)"
	docker compose -f src/docker-compose.yml down --rmi all
	sudo rm -rf $(DATA_DIR)

clean: down
	@echo "$(GREEN)Insterte contraseña para eliminar las carpetas$(NC)"
	sudo rm -rf $(DATA_DIR)

fclean: clean
	@echo "$(GREEN)Limpiando docker (imagenes,contenedores,redes...)$(NC)"
	docker system prune -af

re: fclean all

