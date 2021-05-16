#!/usr/bin/env bash

service php7.3-fpm start
service nginx start
service mysql start
service --status-all
rm /var/www/html/index.nginx-debian.html

/usr/bin/zsh