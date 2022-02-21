#!/bin/bash

#
#function to teach usage
#
function usage() {
echo "Usage: $0 MOUNT [MOUNTN]..." >&2
}

#
#function to copy
#
function copy_themount() {

	LINENUM=1
	while read LINE
	do
		VAR="$(echo $LINE | awk -F " " '{print $NF}')"
		echo "${VAR}_$(date +%d_%m_%y)"
		#echo "$VAR_$(command)" did not print the $VAR value hence use ${VAR}
		# here you can probably add the copy command
		((LINENUM++))
	done < ./file_mounts

}

#
#function to create the file with information on the mounts to be copied
#this function takes an argument which is user defined, and it is the SID-->First Iteration
function create_file_mounts2copy() {
	
	ID=$1
	touch file_mounts
	chmod 755 file_mounts
	df -kh | grep -i $ID 1> file_mounts

}
#this function takes the argument with Script --> SecondIteration

function copy_themount2() {
	MNTLOC=${1}
	echo "from insdie the function --> ${MNTLOC}"
}


#check free space
function spacecheck() {
	MNTLOC=${1}
	SPACE=$(df -kh ${MNTLOC} | awk -F " " '{print $((NF-1))}' | tail -1 | head -c1)
	if [[ $SPACE -eq 0 ]]
	then
		return 0
	else
		return 1
	fi

}


#
#Main function
#give id as dev in pluralsight
#read -p "enter the ID - " X

#below section is when we give the mount values while running the script
#added it in the second iteration
#-------------------------------------------------2nd Iteration-----------------------
#check if the script is run with proper inputs in case of no read statement is present.
#yu can create a USAGE function
if [ -z "${1}" ]
	#be careful about the SPACE in the above if expression
then
	usage
else
	echo "${@} will be copied"
fi


#you can take store a set of mount points to be taken backup in an array and then pass each value 
#to the function which copies it
MNTLIST=${@}

for i in ${MNTLIST}
do
	echo "from the main function ==> ${i}"
	#check if there is enough space on the mount
	spacecheck ${i}
	if [ ${?} -eq 0 ]
	then
		copy_themount2 ${i}
	else
		echo "the space @ ${i} is not Zero"
	fi

done



#-------------------------------------------End of 2nd Iteration----------------------
#isolate the mounts to be copied
#create_file_mounts2copy $X


#take backup of the mount
#copy_themount

