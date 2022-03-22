#!/bin/bash
#awk -F " " 'BEGIN {print "No:\t","No.\t","No:\t","No.\t\n";}
#{printf "%d  %d %d %d",$NF,$(NF-1),$(NF-2),$(NF-3)";
#printf "\n";}
#END {print"====================================="}' file8

awk -F " " 'BEGIN{print "No:\t","No.\t","No:\t","No.\t\n"; print "======== ============"}
{AVG=($1+$2)/3;print (($1+$2)/3),"\t",$(NF-1),"\t",$(NF-2),"\t",$(NF-3),"\t",AVG }
END{print "------";printf "%.3f",AVG}' file8

