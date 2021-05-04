#Base image installation
FROM debian:buster

#COPY everything that you need that's in the srcs dir

RUN apt-get -y update && apt-get -y install wget\
			nginx \
			mariadb-server \
			php \
			php-cli \
			php-cgi \
			php-mbstring \
			php-fpm \
			php-mysql \
			libnss3-tools
EXPOSE 80
EXPOSE 443
RUN apt-get install -y vim zsh git fzf ack
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
RUN			service mysql start && \
			mysql -u root -e "CREATE USER 'user'@'localhost';" && \
			mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('password') WHERE User='user' AND Host='localhost';" && \
			mysql -u root -e "CREATE DATABASE wordpress;" && \
			mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'localhost';" && \
			mysql -u root -e "CREATE DATABASE phpmyadmin;" && \
			mysql -u root -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'user'@'localhost';" && \
			mysql -u root -e "FLUSH PRIVILEGES;"
#RUN			wget https:

WORKDIR /root/
#ENTRYPOINT ["bash", "container_entrypoint.sh"]