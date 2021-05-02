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
RUN apt-get install -y vim zsh git fzf ack
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
COPY srcs ./root/
WORKDIR /root/
#ENTRYPOINT ["bash", "container_entrypoint.sh"]