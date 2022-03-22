#https://leetcode.com/problems/valid-phone-numbers/
grep -E "(^[0-9]{3} )([0-9]{5} )([0-9]{4} )|(^[a-c]{3} )|^(\([0-9]{3}\) )" file8
#        ( )-- with -E all is normal it is not checked, but gruped
#                  the blanck space here is considered blank
#                                           This is OR and is considered
#							 \ is used to literally consider (, this is because we use -E




sed -n '/^[0-9][0-9][0-9] [0-9]\{5\} \|^([0-9][0-9][0-9]) /p' file8
#    /p has to be used with -n to supress stdout
#			 Here the space is CONSIDERED
#				Here {5} ie. repittition of 5times have to be mentioned like this
#				     \| will represent | ie. OR



#==== OR ===
ls | grep -E "^[fc]"
ls | grep -E "(f|c)"
ls | grep "f\|c"


#==== AND -====
ls|grep "f.*7"
ls|grep "f" | grep 7

