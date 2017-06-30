#!/bin/sh

docker images | awk '{print $1":"$2}' | grep -v REPO > list.txt
while read LINE
do 
	filename=${LINE//\//-}
	filename=${filename//:/-}
	echo "Saving file $filename.tar"
	docker save $LINE > $filename.tar
	gzip $filename.tar
	echo OK
done < ./list.txt

echo FINISH
