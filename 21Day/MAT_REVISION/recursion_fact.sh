#!/bin/bash 
function fact() {

 local NUM=${1}
 if [[ $NUM -gt 1 ]]
then
	NEXT=$((NUM-1))
#	FACTORIAL=$(( NEXT * FACTORIAL ))
	FACTORIAL=$( echo "$NEXT * $FACTORIAL" | bc -l)
#	echo "Num Value $NUM iteration $NEXT and FACT value $FACTORIAL"
	fact $NEXT
fi
}
FACTORIAL=${1}
fact ${1}
echo $FACTORIAL
