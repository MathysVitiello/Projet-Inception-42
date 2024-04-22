FROM debian:bullseye

RUN apt update -y \
    && apt upgrade -y \
    && apt-get -y install wget

RUN apt-get install -y php7.4\
    php-fpm\
    php-mysql\
    mariadb-client
# peut etre pas la bonne version de php

RUN mkdir -p /var/run/

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

# wp-config.php est dans /var/www donc je le modifie grace a sed
RUN   sed -i "s/'votre_nom_de_bdd'/'$SQL_DATABASE'/g" /var/www/wordpress/wp-config-sample.php 
RUN   sed -i "s/define( 'DB_PASSWORD', 'votre_mdp_de_bdd' );/define( 'DB_PASSWORD', '$SQL_PASSWORD' );/g" /var/www/wordpress/wp-config-sample.php 
RUN   sed -i "s/define( 'DB_USER', 'votre_utilisateur_de_bdd' );/define( 'DB_USER', '$SQL_USER' );/g" /var/www/wordpress/wp-config-sample.php 
RUN cp /var/www/wordpress/wp-config-sample.php  /var/www/wordpress/wp-config.php && rm /var/www/wordpress/wp-config-sample.php

# fichier config pourphp fpm

COPY php.ini /etc/php/7.4/fpm/php.ini

# /etc/php/7.4/fpm# cat php.ini

# modification et rename du fichier
# ! a changer apres les mdp avec .env

EXPOSE 9000

RUN mkdir -p /run/php/

CMD ["/usr/sbin/php-fpm7.4", "-F"]