#!/bin/bash
#
#function to copy
#
function copy_themount() {

	LINENUM=1
	while read LINE
	do
		VAR="$(echo $LINE | awk -F " " '{print $NF}')"
		echo $VAR
		# here you can probably add the copy command
		((LINENUM++))
	done < ./file_mounts

}

#
#function to create the file with information on the mounts to be copied
#this function takes an argument which is user defined, and it is the SID
function create_file_mounts2copy() {
	
	ID=$1
	touch file_mounts
	chmod 755 file_mounts
	df -kh | grep -i $ID 1> file_mounts

}

#
#Main function
#give id as dev in pluralsight
read -p "enter the ID - " X
create_file_mounts2copy $X
copy_themount

