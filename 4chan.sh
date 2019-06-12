echo 'red boards only'          

read l;

b=$(echo $l | cut  -d/ -f4);
t=$(echo $l | cut  -d/ -f6);


if [ ! -d "/4chan/$t-$b" ]; then

mkdir -p ./4chan/$t-$b;
cd ./4chan/$t-$b;

else

cd ./4chan/$t-$b;

fi

for n in $(curl -sb -H  http://a.4cdn.org/${b}/thread/${t}.json | sed 's/filename/\n/g' | sed 's/time/\n/g' | grep -o ext.* | sed 's/\"\,.*tim\"//;s/ext\"\:\"//g;s/\,\"//g' | sed -E 's/(.*):(.*)/\2\1/'| sed "s|^|https://is2.4chan.org/${b}/|g" | grep '.*jpg\|.*png\|.*gif\|.*webm') ; 

do wget -nc  $n ; 

done

