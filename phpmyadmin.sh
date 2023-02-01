PMA=$(dpkg-query -W -f='${Status)' phpmyadmin 2>/dev/null | grep -c 'ok installed')
if [ $PMA -eq 0 ];
  then
  echo "PhpMyAdmin'i paigaldus koos vajalikute lisadega"
  apt install phpmyadmin
  echo "PhpMyAdmin on nüüd paigaldatud"
elif [ $PMA -eq 1 ]; 
  then
  echo "PhpMyAdmin on juba varem paigaldatud"
fi
