#!/bin/bash


#
#add 2 number with expr
#add 2 with $(())
#add 2 with let
#use array & print the whole array
#
ARR[1]=$( expr 1 + 1 ) # here always be wary about the spaces between the sign and all that
ARR[2]=$((2+2)) #simple addition with $(())
let ARR[3]='3+3' #i don not use it much
echo ${ARR[@]}

#
#multiple numerical operators	
#how to manage floating point numbers with printf and bc
#add the whole expression
#Multiply two floating point variables
#
ARR[4]=$((5+6/45+(3/21)**2)) #the problem here is the output will be integer
ARR[5]=$(echo "5+6/45+((3/21)*2)"|bc -l) # when ever you want to get a floating point - USE THIS
ARR[6]=$(printf "%.3f" ${ARR[5]}) # best ROUNDING OFF algo
#R=$(echo ${ARR[6]} | bc)
#ARR[7]=$(( R * 2 ))
#echo $((R*2)) | bc -la

ARR[7]=$(echo "${ARR[6]}*2"|bc) # this is to stamp into your head that whenever floating point use this
ARR[8]=$(echo "${ARR[7]}^2"|bc) # check out the exponent sign ^
echo ${ARR[@]}

ABC=$( echo "(-105.5*7+50*3)/20 + (19^2)/7" | bc -l) # here if you use only bc, you will get an INTEGER, hence use bc -l
printf "%.3f" $ABC
