#!/bin/bash
file=/var/www/html/index.html
user=$(whoami)
#Vaatab, kas PHP juba eksisteerib
php=$(dpkg-query -W -f='${Status}' php 2>/dev/null | grep -c 'ok installed')
if [ $php -eq 0 ]
then
#Paigaldab PHP
	echo "Alustan php paigaldamise"
	apt install php7.0 libapache2-mod-php7.0 php7.0-mysql
	echo "Php on paigaldatud"
elif [ $php -eq 1 ]
#PHP on paigaldatud.
then
	echo "Php on juba paigaldatud"
	systemctl start php
	systemctl status php
fi

if [ $php -eq 1 ]
then
sed -i "s/Php Debian Default Page/$user s php Debian Page/g" $file
else
echo "php ei paigaltatud õigesti"
fi
