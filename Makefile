.PHONY: up down restart logs build
DOCKER_COMPOSE = docker compose
# Lancer un service spécifique avec make up svc="notebook"
up:
	$(DOCKER_COMPOSE) up -d  $(svc) 

# Arrêter un service spécifique avec make down svc="notebook"
down:
	docker compose --profile $(svc) down

# Redémarrer un service spécifique avec make restart svc="notebook"
restart:
	docker compose --profile $(svc) restart

# Voir les logs d'un service avec make logs svc="notebook"
logs:
	docker compose logs -f $(svc)

# Construire un service avec make build svc="notebook"
build:
	docker compose build $(svc)

# Lancer tous les services
up-all:
	docker compose up -d

# Arrêter tous les services
down-all:
	docker compose down
exec:
	docker exec -it $(svc) /bin/bash