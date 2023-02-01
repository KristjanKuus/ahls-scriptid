#!/bin/bash
if [ $# -ne 1 ];
   then
    echo "Kasutusjuhend: $0 failinimi"
else
  failinimi-$1
 if [ -f $failinimi -a -r $failinimi ]; then
   echo "fail on korras"
   for rida in $(cat $failinimi)
   do
     kasutajanimi-$(echo "$rida" | cut -fl -d:)
     sh lisa kasutaja Skasutajanimi
     echo "$rida" | chpasswd
    done
  else
echo "probleem failiga $failinimi"
  fi
fi
