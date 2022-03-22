#!/bin/bash
awk -F " " 'BEGIN {print "NAME \t AVG \t "}
{AVG=($2+$3+$4)/3;
print AVG;
if (AVG>90)
print $1,"\t",AVG;
else if (AVG>40)
print $1,"\t",AVG;
else
print $1,"\tFAIL";
}
END{print "------------------------------------------"}' file4
