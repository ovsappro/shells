#
/bin/bash
STRING="HelloWorld"


echo "print STRING[0] ${STRING[0]}"
echo "print STRING[1] ${STRING[1]}"
echo "print [${#STRING[@]}]"
#all the abover operations that are for ARRAY would not work


IND=$(echo $STRING | wc -c ) # this gives output 11 -- which is 9+2
echo $IND
#how to parse through each character
echo "FIRST CHARA: ${STRING:0:1}"
echo "LAST CHARA: ${STRING:$IND-2:1}"
#echo "LAST CHARA: ${STRING:(($($STRING|wc -c)-1)):1}"


echo ${#STRING} # this is the better way to get length of a STRING


#2D array
for (( i=0;i<5;i++ ))
	do
		for ((j=0;j<5;j++))
		do
			ARR=("${ARR[@]}" "[$i][$j]")
		done
	done
	echo "this is the[3][1] eleent when we have 5 columns: ${ARR[15]}"

#	(no of cols)*(i-1) + (j-i) # if it starts with 0
