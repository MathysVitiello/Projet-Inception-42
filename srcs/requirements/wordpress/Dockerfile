FROM debian:bullseye

RUN apt update -y \
    && apt upgrade -y \
    && apt-get -y install wget

RUN apt-get install -y php7.3\
    php-fpm\
    php-mysql\
    mariadb-client
# peut etre pas la bonne version de php

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
# surement changer la version de worpdress

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN		chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#installer cli 



# wp-config.php est dans /var/www donc je le modifie grace a sed, cest easy
#  mot de passe, son nom et son host. USER = mysql
RUN   sed -i "s/'votre_nom_de_bdd'/'inception_bdd'/g" /var/www/wordpress/wp-config-sample.php 
# nom de bdd

RUN   sed -i "s/define( 'DB_PASSWORD', 'votre_mdp_de_bdd' );/define( 'DB_PASSWORD', 'inception' );/g" /var/www/wordpress/wp-config-sample.php 
# MDP

RUN   sed -i "s/define( 'DB_USER', 'votre_utilisateur_de_bdd' );/define( 'DB_PASSWORD', 'mathys_quoicoubeh' );/g" /var/www/wordpress/wp-config-sample.php 

RUN cp /var/www/wordpress/wp-config-sample.php  /var/www/wordpress/wp-config.php && rm /var/www/wordpress/wp-config-sample.php

RUN   echo "clear_env = no" >> /etc/php/7.4/cli/php.ini  
RUN   echo "listen=wordpress:9000" >> /etc/php/7.4/cli/php.ini  

# //! modifier le fichier de conf ! fonctionne, verfiier que cest le bon