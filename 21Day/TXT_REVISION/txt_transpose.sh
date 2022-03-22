#!/bin/bash
more file9

#here changing a matrix to one line so that my equation can be used
TXT=$(more file9 | xargs)
echo $TXT # just checking the one line

#here we are finding the colum length number of total element/number of rows
T=$(($(echo $TXT|tr ' ' '\n'|wc -l)/$(more file9|wc -l)))
#what we have used here is ABC=$(()) format, here T is the total column

#here we are finding the numbe rof Rows
R=$(more file9|wc -l)
echo $T

#here we are passing the Variables from outside to inside
echo $TXT | awk -F " " -v Tcol=$T -v Trow=$R '
BEGIN{print "Total Col =",Tcol;}
{
for(i=1;i<=Tcol;i++) 
{ for (j=1;j<=Trow;j++)
	{POS=((j-1)*(Tcol))+i;
	printf "%s ",$POS;	
	}
printf "\n";
}
}' 
