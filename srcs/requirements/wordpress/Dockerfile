FROM debian:bullseye

RUN apt update -y \
    && apt upgrade -y \
    && apt-get -y install wget 

RUN apt-get install -y php7.4\
    && apt-get install php7.4-fpm -y \ 
    php-fpm -y\
    php-mysql -y\
    mariadb-client -y

RUN mkdir -p /var/run/

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli.phar

COPY conf/auto_config.sh /etc/wordpress/
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 777 /etc/wordpress/auto_config.sh

ENTRYPOINT ["/bin/sh", "-c", "/etc/wordpress/auto_config.sh"]

