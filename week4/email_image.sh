#!/bin/bash - 
#===============================================================================
#
#          FILE: email_image.sh
# 
#         USAGE: ./email_image.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 18/08/15 13:44
#      REVISION:  ---
#===============================================================================

for var in "$@"
do
	display "$var"
	echo "Address to e-mail this to?"
	read email
	title=`echo $var | rev | cut -c 5- | rev `


	echo "Message to accompany image?"
	read message

	echo "$message" | mutt -s $title $email -a $var 
done

