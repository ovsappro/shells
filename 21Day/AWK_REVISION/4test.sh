#!/bin/bash
#this is same as test.sh quetion
awk -F " " '{AVG=($2+$3+$4)/3;
if (AVG>90 && $2>40 && $3>40)
print $0,":","GOOD";
else if (AVG>40 && $2>40 && $3>40)
print $0,":","PASS";
else 
print $0,":","FAIL";}' file4
