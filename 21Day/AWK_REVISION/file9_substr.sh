#!/bin/bash
GAR=(1 2 3 4)
CAR="Come on over , come one"
HAB=$(awk -v ARR="$CAR" 'BEGIN {
ARR=toupper(ARR);
print ARR, "\n"
LEN=length(ARR)
print LEN
print (substr(ARR,1,5))

}')
echo "outside" $HAB | tr "[[:upper:]]" "[[:lower:]]"
echo "$HAB" | tr "[cC]" "j"

#more file7 | tr "me" "lEK"  #tr changes 1:1 m changed with l and e with E, no K is used

sed -n '/more/p' file7 #print lines with word "more"

