#!/bin/bash

declare -A singlet
headwon=0
tailwon=0

for ((i=1;i<=$number;i++))
do
	flip=$(($RANDOM%2))
	singlet[$i]=$flip
	if [ $flip -eq 0 ]
	then
		((tailwon++))
	else
		((headwon++))
	fi	
done	

echo "Stored simuation results are : "${singlet[@]}
echo "Singlet combination head win percent = "
echo $headwon $number | awk '{print 100*$1/$2}'
echo "Singlet combination tail win percent = "
echo $tailwon $number | awk '{print 100*$1/$2}'