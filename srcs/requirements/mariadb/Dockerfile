FROM debian:bullseye
# buster
RUN apt update -y \
    && apt upgrade -y \
    && apt-get install mariadb-server -y

# RUN apt-get install mysql-server -y


COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY script.sh	/etc/mysql/script.sh

ENTRYPOINT [ "sh", "/etc/mysql/script.sh" ]
# jespere que ce fonctionne mais il faudrat verifier quand les mdp seront mis


# ! POUR MARIA, ILS DEMANDENT UN MDP, ASKIP UTILISER .ENV dans srcs
