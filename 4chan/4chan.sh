



for l in `cat links` ; do 


b=$(echo $l | sed  's/.*org\/\(.*\)\/thread.*/\1/');
t=$(echo $l | awk -F "/" '{print $NF}');


if [ ! -d "/4chan/$t-$b" ]; then

mkdir -p ./4chan/$t-$b;
cd ./4chan/$t-$b;

else

cd ./4chan/$t-$b;

fi

for n in $(wget -qO - $l | pup .file a attr{href} ) ;  

do wget -nc  "https:$n" ; 

done

cd ../../


done












