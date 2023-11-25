#! /bin/bash

sleep 10

wordpresspath='/var/www/html'

if [ ! -f "$wordpress_path/wp-config.php" ]; then

	wp core download --allow-root --path='/var/www/html'

	wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb_c:3306 --path='/var/www/html'

	wp core install --allow-root --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --path='/var/www/html'

	wp user create --allow-root $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role=author --path='/var/www/html'
fi


php-fpm7.4 -F
