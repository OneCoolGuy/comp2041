#!/bin/sh

while read input 
do
	echo  $input | sed -r >temp "s/[0-4]/</g" 
	cat <temp |  sed -r >output "s/[6-9]/>/g"
	cat < output
done < "${1:-/dev/stdin}"


rm temp
rm output



# while ($input != EOF); do

