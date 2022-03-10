#!/bin/bash
declare -A ARR
ARR[IND]="COC"
ARR[IND]="BOB" # only one value per key
echo ${ARR[IND]}
echo ${!ARR[@]} # you can only disply the whole of Keys, not keys from values
printf "%s %s" "HELLO" ${ARR[@]}
#echo ${ARR[@]}
