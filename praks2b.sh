#!/bin/bash
if [ $# -ne 1 ];
 then
   echo "Alustage programm koos kasutaja failiga"
else
   fail=$1
  if [ -f $fail -a -r $fail ];
    then
     echo "fail on korras"
     for nimi in $(cat $fail)
     do
      sh praks2a.sh $nimi
    done
 else
   echo "probleem failiga, kust v6etakse kasutajad, $fail"
  fi
fi
