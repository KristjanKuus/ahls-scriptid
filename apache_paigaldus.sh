#!/bin/bash
#Paigaldab Apache

file=/var/www/html/index.html
user=$(whoami)
apache2=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed')
if [ $apache2 -eq 0 ]
then
	echo "Alustan apache2 paigaldamise"
	apt install apache2
	echo "Apache on paigaldatud"
elif [ $apache2 -eq 1 ]
then
	echo "Apache2 on juba paigaldatud"
	systemctl start apache2
	systemctl status apache2
fi

if [ $apache2 -eq 1 ]
then
sed -i "s/Apache2 Debian Default Page/$user s Apache2 Debian Page/g" $file
else
echo "Apache2 ei paigaltatud õigesti"
fi
