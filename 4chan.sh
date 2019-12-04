#!/bin/bash

l=$1;
b=$(echo $l | sed  's/.*org\/\(.*\)\/thread.*/\1/');
t=$(echo $l | awk -F "/" '{print $NF}');


if [ ! -d "/4chan/$t-$b" ]; then

  mkdir -p ./4chan/$t-$b;
  cd ./4chan/$t-$b;

else

  cd ./4chan/$t-$b;

fi

  for n in $(curl -s  -Sb -H $l |sed 's/_blank/\n/g' | grep -o 'File: <a href=".*target' | sed 's/File.*="/https:/g;s/".*//g') ; 

  do wget -nc  $n ; 

done
