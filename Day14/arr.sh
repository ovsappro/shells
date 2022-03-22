#!/bin/bash
#https://leetcode.com/problems/validate-stack-sequences/
ARR="1 2 4 3"
echo ${ARR[@]}
VAR=$( echo ${ARR[@]}|tr " " "\n"| sort)
echo $VAR
echo ${ARR[@]}|tr " " "\n"| sort
