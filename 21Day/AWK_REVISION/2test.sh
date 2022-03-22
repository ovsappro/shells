#!/bin/bash
function concat()
{
	# V V IMPORTANT --> below you have to read the whole things that is passed
	#check out the A=(${@}) this is very necessary to assign input as an array entry ; for single entries it is ${1}
	local A=(${@})
	echo ${A[@]}
	for ((j=1;j<5;j++)) # we could not start with 0, because 0%2=0
	do
		printf " ${A[$((j-1))]};"
		CHK=$((j%2))
		if [[ $CHK -eq 0  ]]
		then
			echo " "
		fi

	done

}




#read the Array of 5 names
for ((i=0;i<3;i++)) #PLEASE NOTEthe double brackets here will be a necessity, 
do
	read -p "enter the info of first Student ${i}"  INP <<< $(echo "shyam 66 77 88")
	ARR[$i]="$INP"
done
concat ${ARR[@]}
#echo ${ARR[@]} #PLEASE NOTE : do not forget the the {}
