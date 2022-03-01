#!/bin/bash 
#function to do the factorial proess
function fact () {
local NUM=${1}
local COUNTER=1
local FACTORIAL=1
#for i in {1..${NUM}..1} --- THIS WONT WORK because of $NUM
while [ $COUNTER -le $NUM ]
do
	FACTORIAL=$((FACTORIAL*COUNTER))
	((COUNTER++)) #here i tried $((C++)) this wont work
done
echo "factorial is $FACTORIAL"
}




#main function
# read the number
read -p "enter the number \t:" X
fact ${X}
