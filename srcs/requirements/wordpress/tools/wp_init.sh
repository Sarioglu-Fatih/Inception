
sleep 10

cd /var/www/wordpress
if ! wp core is-installed --allow-root
then
	wp core download --path=/var/www/wordpress --allow-root
	wp config create --allow-root --path=/var/www/wordpress --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PWD --dbhost=mariadb --dbprefix=wp_  --force
	wp core install --allow-root --url=https://fsariogl.42.fr --url=$DOMAIN_NAME --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --title=$WP_TITLE --admin_email=$WP_MAIL
	wp plugin update --allow-root --all
	wp user create --allow-root $WP_USER subscriber_here@student.42lyon.fr --role=subscriber --user_pass=$WP_USER_PWD
fi
mkdir -p /run/php/
php-fpm7.3 -F
