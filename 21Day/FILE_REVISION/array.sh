#!/bin/bash

#
#create an array
while read LINE
do
	ARR=(${ARR[@]} ${LINE})		#create an array, by upending to the existing ARR
done < countries

echo "ARRAY is ${ARR[@]}"

#
#
#here we are going to chekc if there are A or a present in each country name
#if it is present do n ot display it
#
COUNTER=0
for i in ${ARR[@]} # be careful here it is ${ARR[@]}
do
#	echo $i
	#check if there is an a or A
	ARR_NEW=${i[@]/*[aA]*/"ooo"} # please note : any string is an ARRAy; and can be used to check and replace
	
	#
	#print in no A or a; else delete the entry
	#
	if [[ "${ARR_NEW}" == "ooo" ]]
	then
		unset ARR[$COUNTER] # please be careful : DO NOT USE $ or anything befre the array name
	else
		echo $ARR_NEW # actually this is not needed since we are making changes with UNSET and displaying at the end
#		echo -e  "\n" # be careful here, for echo to read these we need \n
	fi
	((COUNTER++)) # please note there is no $ sign to precede
done
echo ${ARR[@]}
