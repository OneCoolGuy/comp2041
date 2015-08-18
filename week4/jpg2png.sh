#!/bin/bash - 
#===============================================================================
#
#          FILE: jpg2png.sh
# 
#         USAGE: ./jpg2png.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 18/08/15 13:42
#      REVISION:  ---
#===============================================================================


>temp

{ ls | egrep ".*\.jpg"  ; ls | egrep ".*\.png" ; } | rev | cut -c 5- | rev | sort | uniq -u >temp
{ ls | egrep ".*\.jpg"  ; ls | egrep ".*\.png" ; } | rev | cut -c 5- | rev | sort | uniq -d >dupl
	
cat temp
while read line
do
	if [ -f "$line.jpg" ]
	then
		convert "$line.jpg" "$line.png"
		rm "$line.jpg"
	fi
done <temp

while read line
do
	echo "$line.png already exits"
done <dupl

rm temp
rm dupl
