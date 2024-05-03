#!/bin/bash

# Vérification des privilèges root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please get root privileges and restart" 1>&2
  exit 1
fi

apt update && apt upgrade
apt install apache2
service apache2 status
apt install mariadb-server mariadb-client
echo "y
n
y
y
y
y
" | mysql_secure_installation
apt install php php-mysql
mysql -u root -p < auto_install_wp.sql
cd /tmp && wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
cp -R wordpress /var/www/html/
chown -R www-data:www-data /var/www/html/wordpress/
chmod -R 755 /var/www/html/wordpress/
mkdir /var/www/html/wordpress/wp-content/uploads
chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/
