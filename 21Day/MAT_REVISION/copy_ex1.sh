#!/bin/bash
#
#revision, trying to do a copy
#Read from a file the mounts/get it as input; then copy it to FILENAME_date format at /backup location
#
#mkdir /dev/backup
LINENUM=1
while read LINE
do
	MNT=$(echo $LINE | awk -F "/" '{print $NF}')
	cp -Rpf $MNT /home/nt-user/workspace/backup/${MNT}_$(date +"%d%m%y_%T")
	#this is one of those things that was checked how to combine the paths
done < ../fsmounts
