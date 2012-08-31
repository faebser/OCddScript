#!/bin/bash

fullDev=`df -l | grep OPEN | cut -c 1-8`
df -l | grep /media | grep -v OP | while read -r file
do 
	realfile=`echo $file | cut -c 1-8`
	echo "dd working on $realfile"
	dd if="$fullDev" of="$realfile" bs=64M &
done
