chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
echo "........000000000000"


service mariadb start;
echo "111111111111"
# su - // jai essaye de strucs mais ke me comrped tj pas, oklm
mysql -u root
echo "23333333333333333"

sleep 10;

echo "bbbbbbBB"
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
echo "AAAAA"
mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb-admin -u root -p$SQL_ROOT_PASSWORD shutdown
mysqld