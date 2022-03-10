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
	ARR_NEW=${i[@]//a/A} # please note : any string is an ARRAy; and can be used to check and replace
echo $ARR_NEW	
	#
	#print in no A or a; else delete the entry
done
