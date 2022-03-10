#!/bin/bash  
#https://www.hackerrank.com/challenges/awk-3/problem

# slice the input & do the calculation
function slice() {
	local STR=${@} # please note when you are entering here a 1 2 3 you have to use ${@}; ${1} will give a only 
echo $STR
local NAME=$(echo $STR | awk -F " " '{print $1}')
#please note : you cannot give STR as the second argument with awk, you have to echo string | awk 
echo $NAME

local AVG11=$(echo $STR | awk -F " " '{print (($2+$3+$4)/3)}')
echo $AVG11
# here we have to use $ before the like $()
#also as you can see you can add directly here, you will even get the floating point answer

#you cannot use the normal if to compare floating point numbers
# there is noe space before and after XX = XX is wrong it should be XX=XX
# you are not able to check the value from outside like $AVG11
local RESULT=$(echo $STR | awk '{AVG1=($2+$3+$4)/3; 
if  (AVG1 > 80)
print $STR"==>AVG is  " AVG1" A grade";
	else if (AVG1 > 70)
	print $STR ": B grade";
		else if (AVG1 < 40) 
		print ": Sorry";
			else
			print "OK";
			}')
echo $RESULT
}

# read the input shyam 99 99 80
read -p "enter NAME S1 S2 S3" X
echo $X
slice $X
