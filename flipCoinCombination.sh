#!/bin/bash

read -p "Enter number of required flips : " number

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

declare -A doublet

headheadwon=0
headtailwon=0
tailheadwon=0
tailtailwon=0

# HH = 11, HT = 10, TH = 01, TT = 00

for ((i=1;i<=$number;i++))
do
	flip=$((($RANDOM%2)*10+($RANDOM%2)))
	if [ $flip -eq 11 ]
	then
		doublet[$i]="HH"
		((headheadwon++))
	elif [ $flip -eq 10 ]
	then
		doublet[$i]="HT"
		((headtailwon++))
	elif [ $flip -eq 1 ]
	then
		doublet[$i]="TH"
		((tailheadwon++))
	else
		doublet[$i]="TT"
		((tailtailwon++))
	fi	
done	

echo "Stored simuation results are : "${doublet[@]}
echo "Doublet combination head-head win percent = "
echo $headheadwon $number | awk '{print 100*$1/$2}'
echo "Doublet combination head-tail win percent = "
echo $headtailwon $number | awk '{print 100*$1/$2}'
echo "Doublet combination tail-head win percent = "
echo $tailheadwon $number | awk '{print 100*$1/$2}'
echo "Doublet combination tail-tail win percent = "
echo $tailtailwon $number | awk '{print 100*$1/$2}'