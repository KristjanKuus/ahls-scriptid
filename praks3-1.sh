#!/bin/bash
lahte=/home/

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

      tar -c -f $filename.$kuupaev.tar $filename/
      gzip $filename.$kuupaev.tar
      mv $filename.$kuupaev.tar.gz $siht

     fi
fi
done
