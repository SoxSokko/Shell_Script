#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Usage: parameter too few"
	return
fi

if [ ! -n "$(echo $1| sed -n "/^[0-9]\+$/p")" ]; then

for pid in `ps -e |grep $2|awk '{print $1}'` ;
do
	for path in `ls -l /proc/${pid}/exe |awk '{print$11}'`;
	do
		parent_dir=`dirname $path`/
		if [ $parent_dir == $1 ]; then
			kill -9 $pid
		else
			echo "not found such path"
		fi
	done
done
else
	kill -9 $1
fi
