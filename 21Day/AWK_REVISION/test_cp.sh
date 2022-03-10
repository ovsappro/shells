#!/bin/bash
awk -F " " '{
AVG=($2+$3+$4)/3;
if (AVG>80)
 print $0,"--> Passed with Distinction";
else if (AVG>40)
print $0,"--> Passed ",AVG;
else
print $1,"FAILED"	;
}' file4
