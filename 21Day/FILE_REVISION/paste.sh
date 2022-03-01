#! /bin/bash
#read the lines & every 3rd line add a new ine
LINENUM=1
COUNTER=1
while read LINE
do
	printf "%s" $LINE
	MOD=$((COUNTER % 3))
	if [[ $MOD -eq 0 ]]
	then
		printf "\n"#printf prints messages in same line, so when we need new line we have to specify
	fi
	((COUNTER++))
done < csv
