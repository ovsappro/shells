#!/bin/bash
ARR=(1 2 4 5 3 4 2 1)
read -p "read the array : " -a ARR1 # -a --> is for array
NUM=8
COUNT=1
for ((i=0;i<${NUM};i+=${COUNT})) #here you have added the variable limit & the increment A+=NUM
do
	printf "The number i = %d \n " $i # here %d is for digit	
	echo ${ARR1[${i}]} # see the {} brackets they are very important here
done

echo "FIRST FOR LOOP iS OVER"
for ((ij=0 ; ij< $(echo ${#ARR1[@]}) ;ij++))
do
	echo "ij = $ij"
	echo "NEW FOR LOOP :-: ${ARR1[@]:${ij}:1}" # look at this here we can see how to slice an array
done
