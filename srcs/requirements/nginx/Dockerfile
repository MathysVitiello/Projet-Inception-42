FROM debian:bullseye

RUN apt update -y \
    && apt install nginx -y \
    && mkdir -p /etc/nginx/ssl \
    && apt-get install openssl 

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mvitiell.42.fr/UID=mvitiell" 

COPY conf/nginx.conf /etc/nginx/nginx.conf


CMD [ "nginx", "-g", "daemon off;" ]
# docker run -d -p 8080:80 nginx
# surement a ajouter ici