#Vaatab, kas PhpMyAdmin juba eksisteerib
PMA=$(dpkg-query -W -f='${Status)' phpmyadmin 2>/dev/null | grep -c 'ok installed')
if [ $PMA -eq 0 ];
#Kui eksisteeri, paigaldada
  then
  echo "PhpMyAdmin'i paigaldus koos vajalikute lisadega"
  wget https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb
  dpkg -i mysql-apt-config_0.8.24-1_all.deb
  apt install mysql
  apt install php
  apt install phpmyadmin
  echo "PhpMyAdmin on nüüd paigaldatud"
elif [ $PMA -eq 1 ];
#PhpMyAdmin on paigaldatud.
  then
  echo "PhpMyAdmin on juba varem paigaldatud"
fi
