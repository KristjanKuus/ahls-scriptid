#!/bin/bash
echo "Sisetage kaust, mida soovite varundada. (Sisetage täis tee, mille lõppus ja alguses on juttumärgid)"
read kaust
echo "Sisetage siht, kuhu varundused salvestada. (Sisetage täis tee, mille lõppus ja alguses on juttumärgid)"
read siht

if [[ ! -z "$kaust" ]]; then
  kuupaev=`date +%d.%m.%Y`
  tar -c -f $filename.$kuupaev.tar $filename/
  gzip $filename.$kuupaev.tar
  mv $filename.$kuupaev.tar.gz $siht
else
  echo "Sisestage Kausta tee oigesti, tais tee ja juttumargid"

fi
