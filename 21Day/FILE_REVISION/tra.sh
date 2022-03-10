#!/bin/bash
ARR=(Nin Jon San Fan Kan Lon)
echo $ARR[@] # op :- Nin@
echo ${ARR[@]} | tr '[:upper:]' '[:lower:]'  #nin jon san fan kan lon
echo ${ARR[@]/[A-Z]/"."} #.in .on .an .an .an .on

ARR1=(NinDF JoDFn SanSD FaSFn KaHn LoRn)
echo ${ARR1[@]/#[A-Z]/.} # only the first letter,.inDF .oDFn .anSD .aSFn .aHn .oRn 
echo ${ARR1[@]/*[A-Z]*/.} #. . . . it converts all the words with aps to this
