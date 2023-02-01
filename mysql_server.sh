#Vaatab, kas MySql juba eksisteerib
MYSQL=$(dpkg-query -W -f='${Status)' mysql-server 2>/dev/null | grep -c 'ok installed')
if [ $MYSQL -eq 0 ];
#Kui eksisteeri, paigaldada
  then
  echo "Mysql'i paigaldus koos vajalikute lisadega"
  apt install mysql-server
  echo "Mysql on paigaldatud"
  touch $HOME/.my.cnf
  echo "[client]" >> $HOME/.my.cnf
  echo "host=localhost" >> $HOME/.my.cnf
  echo "user = root" >> $HOME/.my.cnf echo "password = qwerty" >> $HOME/.my.cnf
elif [ $MYSQL -eq 1 ];
#MySql on paigaldatud.
  then
  echo "Mysql Server on juba varem paigaldatud"
  mysql
fi
