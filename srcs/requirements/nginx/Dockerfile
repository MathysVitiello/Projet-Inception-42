FROM debian:bullseye
# debian::bullseye
# buster
RUN apt update -y \
    && apt install nginx -y \
    && mkdir -p /src/requirements/nginx/ssl \
    && apt-get install openssl \
    && openssl req -x509 -nodes -out /src/requirements/nginx/ssl/inception.crt -keyout /src/requirements/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=mvitiell.42.fr/UID=login"\
    && mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html 
# (notre root principal) iic bizarre 

RUN chown -R www-data:www-data /var/www/html
# (l’utilisateur principal)

COPY conf/nginx.conf /etc/nginx/nginx.conf
# index index.php index.html index.htm index.nginx-debian.html ;
# top ! le copy sert a predre un ficher qui existe de nginx et de le remplacer avec celui modifier

CMD [ "nginx", "-g", "daemon off;" ]