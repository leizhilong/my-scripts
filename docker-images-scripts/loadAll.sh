#!/bin/sh

for LINE in `ls *.tar`
do
	echo "Loading $LINE"
	gunzip $LINE
	docker load -i $LINE
	echo OK
done
echo "FINISH"
