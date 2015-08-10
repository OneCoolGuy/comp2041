#!/bin/bash - 
#===============================================================================
#
#          FILE: coures.sh
# 
#         USAGE: ./coures.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 10/08/15 21:15
#      REVISION:  ---
#===============================================================================



{ wget -q -O- "http://www.handbook.unsw.edu.au/vbook2015/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=ALL" | egrep '/'+$1 | sed -n 's/.*\('$1'....\).*html..\(.*\)..A.*/\1 \2/p' ; wget -q -O- "http://www.handbook.unsw.edu.au/vbook2015/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=ALL" | egrep '/'+$1 | sed -n 's/.*\('$1'....\).*html..\(.*\)..A.*/\1 \2/p'; } | sort | uniq -w8

