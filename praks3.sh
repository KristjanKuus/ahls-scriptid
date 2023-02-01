#!/bin/bash
echo "Sisetage kaust, mida soovite varundada. (Sisetage täis tee, mille lõppus ja alguses on juttumärgid)"
read kaust
lahte=$1
echo "Sisetage siht, kuhu varundused salvestada. (Sisetage täis tee, mille lõppus ja alguses on juttumärgid)"
read siht

for filename in $(ls $lahte); do
    result=
    if [ -f $filename ];
       then
        result="$filename on tavaline fail, mitte kaust"
        echo $result
    else
      if [ -d $filename ];
       then
          result="$filename on kaust, tehtakse varukoopia"
          echo $result

      kuupaev=`date +%d.%m.%Y`

      echo "$lahte$filename/"
      tar -c -f $filename.$kuupaev.tar $filename/
      gzip $filename.$kuupaev.tar
      mv $filename.$kuupaev.tar.gz $siht

     fi
fi
done
