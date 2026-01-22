COMPOSE_FILE = src/docker-compose.yml
DATA_DIR = /home/$(USER)/data

.PHONY: all build up down clean fclean re

all: build up

# Create data directories
$(DATA_DIR)/mariadb:
	mkdir -p $(DATA_DIR)/mariadb

$(DATA_DIR)/wordpress:
	mkdir -p $(DATA_DIR)/wordpress

# Build images
build: $(DATA_DIR)/mariadb $(DATA_DIR)/wordpress
	docker compose -f $(COMPOSE_FILE) build

# Start services
up: build
	docker compose -f $(COMPOSE_FILE) up -d

# Stop services
down:
	docker compose -f $(COMPOSE_FILE) down

# Stop containers (no prune global)
clean:
	docker compose -f $(COMPOSE_FILE) down --rmi local

# Full clean (project only)
fclean: clean
	sudo rm -rf $(DATA_DIR)
	sudo docker system prune -af

# Rebuild everything
re: fclean all
