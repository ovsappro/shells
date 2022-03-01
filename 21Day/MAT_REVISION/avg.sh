#!/bin/bash +vx
#read the x number of integers #find the average & print
function rd () {
	echo "$0 --> check ing \$0" # even inside a funciton the $0 is the script name not the function name
LLEN=${1} # here these variables are global, if we use 'local' keyword then you will get syntax error since the next function uses it
echo "LLEN= ${LLEN}"
NUM=0
#FOR LOOP WONT WORK WITH NUM ASSUGNED TO A VARAIBALE for i in {1..${LLEN}..1}
# do not try using UNTIL in these circumstances, it will run UNTIL some condition is satisfied
while [[ ${NUM} -lt ${LLEN} ]]
do
	echo "NUM=> $NUM"	
	((NUM++))
	read -p "${NUM} integer" ARR[${NUM}]
done

echo ${ARR[@]}
return 0
# this shows you care about the values returned and knows exit valye
}

function disp () {
local SUM=0 
local NUM2=0
while [[ ${NUM2} -lt ${LLEN} ]] # here you are using the GLOBAL VARIABLE LLEN
do 
	((NUM2++)) #incrementin the array position
	SUM=$(( ${SUM} + ${ARR[${NUM2}]} ))#variable to store the SUM
done

local AVG=$(echo "${SUM}/${LLEN}" | bc -l)
printf "The average = %.3f" $AVG
}


#read the number of integers
read -p "enter the number of Integers" X
if [[ (${X} -gt 5) || ($X -lt 1)  ]] 
then
	echo "Please enter a valid number" >&2 > $0_$(date +%s).log >&1
	# mention USAGE
	exit 1
else
       echo $X	
	rd $X
	disp
fi
