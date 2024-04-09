FROM debian:buster

WORKDIR /var/www/wordpress
RUN apt-get update -y				\
	&& apt-get upgrade -y			\
	&& apt-get install -y nginx		\
	&& apt-get install curl -y		\
	&& apt-get install openssl -y		\
	&& mkdir -p /etc/nginx/ssl		\
	&& apt-get install curl -y		\
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=fsariogl.42.fr/UID=fsariogl"
CMD rm /etc/nginx/sites-available/default
COPY conf/nginx.conf /etc/nginx/sites-available/default
RUN chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
CMD ["nginx", "-g", "daemon off;"]
