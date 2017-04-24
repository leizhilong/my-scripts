#!/bin/sh

CHROME_NUM=10
CHROME_USER_DIR_ROOT=/tmp
MY_URL="https://www.google.com"

for((i=0;i<$CHROME_NUM; i++))
{
	UD=$CHROME_USER_DIR_ROOT/$i
	echo "Launching Chrome in dir $UD"
	open -a "Google Chrome" -n --args --user-data-dir=$UD $MY_URL1
}
