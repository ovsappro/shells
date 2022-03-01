#!/bin/bash
#find unique entries
#read the input of a particular length
read -p "enter  array eg: 1 1 2 1 2 -> " LEN
#read -p "array -> " -a ARR
ARR=(${LEN})
echo ${ARR[@]} | fold -b1|  sort -n| uniq -c
echo ${ARR[@]} | fold -b1|  sort -n| uniq -c| awk -F " " '{if ($1 == 1) print $2;}'
