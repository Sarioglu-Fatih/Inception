FROM debian:buster
RUN apt-get update -y	\
	&& apt-get -y upgrade	\
	&& apt-get install -y wget	\
	&& apt-get install php7.3 php-fpm php-mysql mariadb-client -y	\
	&& apt-get install -y php-mysqli
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www	\
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar	\
	&& chmod +x wp-cli.phar	\
	&& mv wp-cli.phar /usr/local/bin/wp
RUN cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz	
RUN chown -R root:root /var/www/wordpress	
COPY ./tools/wp_init.sh /tmp/wp_init.sh
WORKDIR /var/www/wordpress
RUN echo "listen = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf
ENTRYPOINT ["sh", "/tmp/wp_init.sh"]
