#!/bin/bash - 
#===============================================================================
#
#          FILE: file_size.sh
# 
#         USAGE: ./file_size.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 10/08/15 19:42
#      REVISION:  ---
#===============================================================================



echo 'Small files:' >small
echo 'Medium-sized files:' >medium
echo 'Large files:' >large
>temp

for file in ./*
do
	wc -l $file >>temp
done

egrep '^[0-9]\s' <temp | sed 's/.*\/\(.*\)/\1/g' | egrep -v 'temp' | egrep -v 'small' | egrep -v 'medium' | egrep -v 'large' >>small
egrep '^[0-9]{2}\s' <temp | sed 's/.*\/\(.*\)/\1/g' | egrep -v 'temp' | egrep -v 'small' | egrep -v 'medium' | egrep -v 'large' >>medium
egrep '^[0-9]{3,}\s' <temp | sed 's/.*\/\(.*\)/\1/g' | egrep -v 'temp' | egrep -v 'small' | egrep -v 'medium' | egrep -v 'large' >>large

awk '{ printf "%s"" ",$0 }' <small
echo
awk '{ printf "%s"" ",$0 }' <medium 
echo
awk '{ printf "%s"" ",$0 }' <large
echo

