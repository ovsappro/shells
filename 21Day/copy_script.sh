#!/bin/bash 

#
#Logging function
#if -v option is selected - print and log
#else only log
#check -vx will add the 1> log 
##also logger command
#
function logger() {
	if [[ ${VERBOSE} == "TRUE"  ]]
	then
		echo "${@}" >> ${0}_$(date +"%d%m%y_%T").log 
		${@}	
		#this line prints it to the output as well, making it verbose
	else
		echo "${@}" >> ${0}_$(date +"%d%m%y_%T").log
	fi
}

#
#function to teach Usage
#
function usage() {
logger echo "Usage: $0 [-vs] MOUNT [MOUNTN]..."  
logger echo "	-v Increase verbosity."
exit 1
}

#
#function to copy, here the mounts are stored in a temporary file called 'file_mounts'
#this function was skipped in the second iteration
function copy_themount() {

	LINENUM=1
	while read LINE
	do
		VAR="$(echo $LINE | awk -F " " '{print $NF}')"
		logger echo "${VAR}_$(date +%d_%m_%y)"
		#echo "$VAR_$(command)" did not print the $VAR value hence use ${VAR}
		# here you can probably add the copy command
		((LINENUM++))
	done < ./file_mounts

}

#
#function to create the file with information on the mounts to be copied
#this function takes an argument which is user defined, and it is the SID-->First Iteration
#this function was also skipped in the second iteration
function create_file_mounts2copy() {
	
	ID=$1
	touch file_mounts
	chmod 755 file_mounts
	df -kh | grep -i $ID 1> file_mounts

}
#
#this function takes the argument with Script --> SecondIteration
#here copyscrpt.sh [-vs] /dev/shm is passed
function copy_themount2() {
	MNTLOC=${1}
	logger echo "from insdie the function --> ${MNTLOC}"
}


#check free space, if free space is more than Zero percent then return 1
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

#
#-----------------------------------Below is 3rd Iteration -- added -v -s options--------------------
#
while getopts vs OPTION
do
	case ${OPTION} in 
		v)
			VERBOSE="TRUE" 
			ARG=${OPTIND}
			ARG1=$((ARG-1))
			shift $ARG1
			echo "ARG is ${ARG} and ARG1 is ${@}"
			# this is the only way to get the remaining arguments
			#learn this shift command and all that
			#if v had an argument to be added eg: v: & 10 then $OPTARG = 10
			;;
		s)
			SILENT="TRUE"
			;;
		?)
			echo "Invalid Option"
			usage 
			# you have to be careful, there is no () after function call
			;;
	esac
done

#---------------------------------end of 3rd Iteration------------------------------------------
#

#below section is when we give the mount values while running the script
#added it in the second iteration
#-------------------------------------------------2nd Iteration-----------------------
#check if the script is run with proper inputs in case of no read statement is present.
#yu can create a USAGE function, check if there are no parameters added
if [ -z "${1}" ]
	#be careful about the SPACE in the above if expression
then
	usage
else
	logger echo "${@} will be copied"
fi


#you can take store a set of mount points to be taken backup in an array and then pass each value 
#to the function which copies it
MNTLIST=${@}

for i in ${MNTLIST}
do
	logger echo "from the main function ==> ${i}"
	#check if there is enough space on the mount
	spacecheck ${i}
#	logger echo "return status --> ${?}"
# only the previous command status is checked so the if loop should be immediately after the function call
#return status check
	if [ ${?} -eq 0 ]
	then
		copy_themount2 ${i}
	else
		logger echo "the space @ ${i} is not Zero"
	fi

done



#-------------------------------------------End of 2nd Iteration----------------------
#isolate the mounts to be copied
#create_file_mounts2copy $X


#take backup of the mount
#copy_themount

