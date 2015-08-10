#!/bin/sh - 
#===============================================================================
#
#          FILE: echon.sh
# 
#         USAGE: ./echon.sh 
# 
#   DESCRIPTION: Receives 2 arguments, a number and a tring, and echos the string that number of times :D
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Lucas Germano da Silva
#  ORGANIZATION: 
#       CREATED: 10/AUG/2015
#      REVISION:  ---
#===============================================================================


 

if  [ $# -ne 2 ] 
then
	echo "Usage: ./echon.sh <number of lines> <string>" >&1
	exit 1
fi

echo $1 | egrep "^[0-9]+$" >temp

if [ -s  temp ]
then
	for i in $(seq 1 $1); do
		echo $2
	done
else 
	echo "argument 1 must be a non-negative integer" >&1
	rm temp
	exit 2
fi


rm temp

