#!/bin/bash
#read a month or a day 
#and say 31 for odd month
#and say Odd for week day

function usage() {
echo "${0} [-m MONTHNO:] [-w Weekno] ARGS" >&2
echo "		-m checks the mont is even or odd" >&2
echo "		-w checks the week is even or odd" >&2
echo "		ARGS displays your arguments"
}



function funmon() {
#this function is to check the month
local MONVAL=$1
local MOD=$((MONVAL%2))
if [[ MOD -eq 0 ]]
then
	echo "Month is even - $MONVAL"
else
	echo "Month is odd - $MONVAL"
fi
}


function funweek() {
#this is to chekc the week
local WEEVAL=$1
local MOD=$(echo "$WEEVAL%2"|bc)
[[ $MOD == 1 ]] && echo "Week is ODD $WEEVAL " || echo "Week is Even $WEEVAL"
}

while getopts m:w: OPTION
do
	case $OPTION in 
		m) 
		MON="true"
		VALM=$OPTARG
		;;
		w)
		WEE="true"
		VALW=$OPTARG
		;;
	esac
done

if [[ $MON == "true"  ]] 
then 
	funmon $VALM
elif [[ $MON != "true" ]]
then
	echo "i am in elif part"
	usage ${@}
else
	echo "this is else"	
fi

if [[ $WEE=="true" ]]
then
	funweek $VALW
fi

echo "======checking out SHIFT========================"
echo ${@}
echo "OPTIND $OPTIND"
IND=$((OPTIND-1))
shift $IND
echo ${@}
