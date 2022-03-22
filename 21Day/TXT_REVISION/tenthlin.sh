#!/bin/bash
# here note that you should not use the $ sign
awk -F " " '{
if (NR == 10)
	{
	print $0;
	}

}' file10
