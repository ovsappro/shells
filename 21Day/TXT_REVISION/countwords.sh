#!/bin/bash
more file7 |tr "[,.:;]" " "|tr -s " " "\n"| sort |uniq -c|sort -r|awk '{print $2, $1}'
