#!/bin/bash - 
#===============================================================================
#
#          FILE: date_image.sh
# 
#         USAGE: ./date_image.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 18/08/15 16:13
#      REVISION:  ---
#===============================================================================


date=""
for var in "$@"
do
	date=`ls -l "$var" | cut -d" " -f6-8`
	convert -gravity south -pointsize 36 -draw "text 0,10'$date'" $var temp
	mv temp $var
	touch -d "$date" $var
	display $var
done


