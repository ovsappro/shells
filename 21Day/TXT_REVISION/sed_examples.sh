#!/bin/bash

#highlightlighting thy --> {thy}
sed 's/thy/{thy}/g' file7

echo "===================================="
echo "=change tHy or THy or tHY etc. to {your}|="
echo "===================================="

sed 's/[tT][hH][yY]/{your}/g' file7

echo "===================================="
echo "=|||||||||the one below also give the same result|||||||||||||||||||||||="
echo "===================================="

sed 's/thy/{your}/ig' file7


echo "===================================="
echo "=change tHy or THy or tHY etc. to {tHy or tHY etc}|="
echo "===================================="

sed 's/[tT][Hh][Yy]/{\&}/ig' file7


echo "===================================="
echo "searching with /dev/tty -- how to use \ -- how to change delimiter"
echo "===================================="
sed 's|\/dev\/tty|\/dev\/pty|g' ../AWK_REVISION/file8

echo "===================================="
echo "===searching pattern==="
echo "===================================="
sed '/\/dev\/tty/ s/dev/gov/ig' ../AWK_REVISION/file8


echo "===================================="
echo "=== search and print those lines, and print only the last field"
echo "===================================="
sed -n '/\//p' ../AWK_REVISION/file8 | awk -F " " '{print $NF}'


echo "===================================="
echo "===to check if a digit repeats thrice"
echo "===================================="
#grep -E '[0-9]{2}' ../AWK_REVISION/file8
grep  "\([0-9]\)\1\1" ../AWK_REVISION/file8

echo "===== line with four or more consecutive numbers"
grep -E "[0-9][0-9][0-9][0-9]+" ../AWK_REVISION/file8 #it is same as without +

#grep -E "\([0-9]+\)" ../AWK_REVISION/file8 ==> this wont work

