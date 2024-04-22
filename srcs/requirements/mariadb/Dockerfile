FROM debian:bullseye

RUN apt update -y \
    && apt upgrade -y \
    && apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY /script.sh	/etc/mysql/script.sh

RUN chmod 755 /etc/mysql/script.sh
RUN chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

ENTRYPOINT [ "sh", "/etc/mysql/script.sh" ]
