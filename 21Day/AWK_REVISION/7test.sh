#!/bin/bash
sed 's/thy/your/ig' file7 #combining ig only possible for s string replacement 
echo "==================================="
sed '/[Tt][Oo]/d' file7


