#!/bin/bash
awk -F " " '{ORS=(NR%2==1)?";":"\n "; print$0 }' file1
# the above command is equal to
# awk -F " " '{ORS=NR%2?";":"\n "; print$0}' file 1
# ternary operator :- (condition)?actionfor1:actionfor0
