#!/bin/bash
#https://www.hackerrank.com/challenges/awk-1/problem?isFullScreen=true
awk -F " " '{
if ($4 == "")
print $1,"not available"
}' file5
