#!/bin/bash
if [ $# -ne 1 ];
  then
   echo "Alustage programm koos soovitud kasutaja nimega"
else
   nimi=$1
   useradd $nimi -m -s /bin/bash
if [ $? -eq 0 ];
  then
   echo "konto nimega $nimi on nüüd lisatud"
   cat /etc/shadow | grep $nimi
   ls -la /home/$nimi
else
    echo "probleem kasutaja $nimi tegemisega"
  fi
fi

