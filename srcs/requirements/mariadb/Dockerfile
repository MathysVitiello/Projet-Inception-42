FROM debian:bullseye
# buster
RUN apt update -y \
    && apt upgrade -y \
    && apt-get install mariadb-server -y 


COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY script.sh	/etc/mysql/script.sh

ENTRYPOINT [ "sh", "/etc/mysql/script.sh" ]