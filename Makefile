NAME =	inception

# Creer les images et lances les conteneurs:
all: 
	docker compose -f ./srcs/docker-compose.yml up -d

# Arret temporaire les conteneurs:
stop:
	docker compose -f ./srcs/docker-compose.yml stop

# Redemarrage des conteneurs:
start:
	docker compose -f ./srcs/docker-compose.yml start

# Arret complet de l'application:
down:
	docker compose -f ./srcs/docker-compose.yml down

# ReBuild de l'application:
re:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

# Arret total de l'application et suppression de toutes les images et volumes:
clean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

# Destruction de tous es conteneurs existants:
fclean: clean
	docker system prune -a

.PHONY: all stop start down re clean fclean
