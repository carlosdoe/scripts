echo 'Link?'

read l;
 
b=$(echo $l | cut  -d/ -f4);
t=$(echo $l | cut  -d/ -f6);

if [ ! -d "/4chan/$b-$t" ]; then

mkdir -p ./4chan/$b-$t;
cd ./4chan/$b-$t;

else

cd ./4chan/$b-$t;

fi

for n in $(curl -sb -H  http://a.4cdn.org/${b}/thread/${t}.json | sed 's/filename/\n/g' | grep -o '.jpg.*md5\|.png.*md5\|.gif.*md5\|.webm.*md5' | sed 's/\".*\"tim\"//g;s/\,\".*//g' | sed -E 's/(.*):(.*)/\2\1/' | sed "s|^|https://is2.4chan.org/${b}/|g") ;

do wget -nc  $n ; 

done
