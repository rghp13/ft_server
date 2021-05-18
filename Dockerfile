#Base image installation
FROM debian:buster

#Commands
#docker run -itp 80:80 -p 443:443 <imagename>
#docker build -t <image name> .
#docker stop <container name>
#docker exec -ti <container id> /bin/zsh
#docker start <container id>
#docker create -it -p 80:80 -p 443:443 <image name>

RUN apt-get -y update && apt-get -y install wget\
			nginx \
			mariadb-server \
			php \
			php-cli \
			php-cgi \
			php-mbstring \
			php-mysqli \
			php-pear \
			php-gettext \
			php-fpm \
			php-mysql \
			php-common \
			php-phpseclib \
			libnss3-tools
EXPOSE 80
EXPOSE 443
WORKDIR /root/
RUN apt-get install -y vim zsh git
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# MYSQL GENERATING DATABASE
RUN			service mysql start && \
			mysql -u root -e "CREATE USER 'user'@'localhost';" && \
			mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('password') WHERE User='user' AND Host='localhost';" && \
			mysql -u root -e "CREATE DATABASE wordpress;" && \
			mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'localhost';" && \
			mysql -u root -e "CREATE DATABASE phpmyadmin;" && \
			mysql -u root -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'user'@'localhost';" && \
			mysql -u root -e "FLUSH PRIVILEGES;"
#WORDPRESS
RUN			wget https://wordpress.org/latest.tar.gz && \
			tar xzf latest.tar.gz && \
			cp wordpress/wp-config-sample.php wordpress/wp-config.php && \
			chown -R www-data:www-data wordpress && \
			chmod -R 775 wordpress && \
			mv wordpress /var/www/html && \
			rm -f latest.tar.gz
#PHPMYADMIN

RUN			wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz && \
			mkdir /var/www/html/phpmyadmin && \
			tar -xzf phpMyAdmin-5.1.0-english.tar.gz && \
			rm phpMyAdmin-5.1.0-english.tar.gz && \
			mv phpMyAdmin-5.1.0-english/* /var/www/html/phpmyadmin && \
			mkdir /var/www/html/phpmyadmin/tmp && \
			chmod 777 /var/www/html/phpmyadmin/tmp && \
			rmdir phpMyAdmin-5.1.0-english
#SSL
RUN			openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/ssl_key.key \
			-x509 -days 365 -out /etc/ssl/certs/ssl_certificate.crt \
			-subj "/C=FR/ST=75/L=Paris/O=42/CN=rpo"
COPY		srcs/default /etc/nginx/sites-available/
COPY		srcs/launch.sh ./
COPY		srcs/autoindex /bin/
COPY		srcs/index.nginx.html /var/www/html/
COPY		srcs/config.inc.php /var/www/html/phpmyadmin/
COPY		srcs/wp-config.php /var/www/html/wordpress/
ENTRYPOINT ["bash", "./launch.sh"]