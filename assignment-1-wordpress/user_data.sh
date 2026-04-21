#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt update -y
apt install -y apache2 mysql-server php libapache2-mod-php php-mysql wget tar unzip

systemctl enable apache2
systemctl start apache2

systemctl enable mysql
systemctl start mysql

mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'StrongPassword123!';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz

rm -rf /var/www/html/*
cp -r wordpress/* /var/www/html/

chown -R www-data:www-data /var/www/html/
find /var/www/html/ -type d -exec chmod 755 {} \;
find /var/www/html/ -type f -exec chmod 644 {} \;

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/wordpress/" /var/www/html/wp-config.php
sed -i "s/username_here/wpuser/" /var/www/html/wp-config.php
sed -i "s/password_here/StrongPassword123!/" /var/www/html/wp-config.php

a2enmod rewrite
systemctl restart apache2