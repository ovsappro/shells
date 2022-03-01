#!/bin/bash 
#create an array of length LEN & assign the values
function create_array() {
local LEN=${1}
local COUNT=1
while [[ $COUNT -le $LEN ]]
do
	read -p " input number $COUNT :" IN
	ARR[${COUNT}]=${IN}
	((COUNT++)) # NO NEED for $ before this, eg: $((COUNT++))
done
}

 
#check if any of the values has occured before/after ; if yes set a counter, if counter more than 1 return NA
function array_check() {
local LENGTH=${1}
local ARRAYPOSITION=1
while [[ ${ARRAYPOSITION} -le $LENGTH ]]
do
	local ARRAYCOUNT=1
	local COUNTER=0 # here i had to change to 0 from 1
	while [[ ${ARRAYCOUNT} -le $LENGTH ]]
	do
		if [[ ${ARR[${ARRAYCOUNT}]} -eq ${ARR[${ARRAYPOSITION}]} ]] # here also ${ARR[0]}
			then 
			((COUNTER++))
		fi
		((ARRAYCOUNT++))
				
	done
#This line was added to check :	echo "${ARR[${ARRAYPOSITION}]} -->  $COUNTER"
	if [[ $COUNTER -gt 1 ]]
		then 
			echo "${ARR[${ARRAYPOSITION}]}"
	fi
	((ARRAYPOSITION++))
done

}


#main function
LEN=${1}
create_array $LEN
#echo "${ARR[@]}   --- ${ARR[2]}" # here you would not be able to run with $ARR[@] # here also just checking 2nd position
array_check $LEN 
echo "thanks"
