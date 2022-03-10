#!/bin/bash -vx
#read -p "enter numbers " A B C D
logit()
{
	echo "YA LOOKED IN"
	if [[ $VERBOSE == "TRUE" ]]
	then
		MSG=${@}
		echo "[$(date +%F-%N)] - $MSG" >> ${0}.log
	fi
	${@}
}

while getopts vs OPTION
do
	case $OPTION in
		v)
		VERBOSE="TRUE"
		;;
		?) echo "no verbose"
		;;
	esac

done
echo "=================================================="
A=3;B=7;C=2;D=4;
SUM=$(($A+$B+$C+$D))
CMP=$(echo "($A*$B)^$C/$D"|bc -l)
FLT=$(echo "(($A*$B)^($C/$D)*3)" | bc -l)
logit printf "%.5f,%.14f,%.3f \n" $SUM $CMP $FLT
logit printf "%.4f", $FLT
echo " ---------------------------------------"
LINUM=1
while read LINE
do
	echo $LINE
	VAR=$(echo $LINE | awk -F "/" '{print $(NF-1)}')
	printf "%s \n\n" $VAR
#	echo $VAR
done < ../fsmounts
echo "-----------------------------------------------"

function fact(){
local NEXT=${1}
local FACT=${2}
echo "$NEXT -- $FACT  "
echo -e  "\n"
if [[ $NEXT -gt 1 ]]
then
local	FACT=$((NEXT*FACT))
	logit fact $((NEXT-1)) $FACT
else
	echo $FACT	
fi

}
FACT=1
echo $(fact 5 1) 
echo "-------------------------------------------"

function lofa(){
NUM=${1}
for ((i=1;i<=$NUM;i++))
do
	FACT=$(echo "$FACT*$i"|bc)
done
echo "FACTORIAL BOYS --> $FACT"
}

lofa 5
echo "---------------------------------------------"
