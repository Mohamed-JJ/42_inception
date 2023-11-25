FROM debian:11


WORKDIR /var/www/html
# in the first layer we update and upgrade the system

RUN apt-get update -y && apt-get upgrade -y

# in this layer we install the wget for the installation of wordpress
RUN apt-get install wget -y


# in this layer we install the php and the php-fpm and the php-mysql and the mariadb-client
RUN apt-get install -y php7.3 php7.4 php-fpm php-mysql mariadb-client spawn-fcgi

RUN mkdir -p /run/php

RUN	chown -R www-data:www-data /var/www/html

RUN chmod -R 775 /var/www/html

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh


CMD ["/tmp/setup.sh"]
