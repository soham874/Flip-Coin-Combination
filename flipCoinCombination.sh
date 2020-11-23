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

echo "SINGLET SIMULATIONS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
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

echo "DOUBLET SIMULATIONS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Stored simuation results are : "${doublet[@]}
echo "Doublet combination head-head win percent = "
echo $headheadwon $number | awk '{print 100*$1/$2}'
echo "Doublet combination head-tail win percent = "
echo $headtailwon $number | awk '{print 100*$1/$2}'
echo "Doublet combination tail-head win percent = "
echo $tailheadwon $number | awk '{print 100*$1/$2}'
echo "Doublet combination tail-tail win percent = "
echo $tailtailwon $number | awk '{print 100*$1/$2}'

declare -A triplet

headheadheadwon=0; tailheadheadwon=0; 
headheadtailwon=0; tailheadtailwon=0;
headtailheadwon=0; tailtailheadwon=0;
headtailtailwon=0; tailtailtailwon=0;

# H = 1, T = 0

for ((i=1;i<=$number;i++))
do
	flip=$((($RANDOM%2)*100+($RANDOM%2)*10+($RANDOM%2)))
	case $flip in 
		0)
			triplet[$i]="TTT"
			((tailtailtailwon++));;
		1)
			triplet[$i]="TTH"
			((tailtailheadwon++));;
		10)
			triplet[$i]="THT"
			((tailheadtailwon++));;
		11)
			triplet[$i]="THH"
			((tailheadheadwon++));;
		100)
			triplet[$i]="HTT"
			((headtailtailwon++));;
		101)
			triplet[$i]="HTH"
			((headtailheadwon++));;
		110)
			triplet[$i]="HHT"
			((headheadtailwon++));;
		*)
			triplet[$i]="HHH"
			((headheadheadwon++));;
	esac
done	

echo "TRIPLET SIMULATIONS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Stored simuation results are : "${triplet[@]}
echo "Triplet combination HHH win percent = "
echo $headheadheadwon $number | awk '{print 100*$1/$2}'
echo "Triplet combination HHT win percent = "
echo $headheadtailwon $number | awk '{print 100*$1/$2}'
echo "Triplet combination HTH win percent = "
echo $headtailheadwon $number | awk '{print 100*$1/$2}'
echo "Triplet combination HTT win percent = "
echo $headtailtailwon $number | awk '{print 100*$1/$2}'
echo "Triplet combination THH win percent = "
echo $tailheadheadwon $number | awk '{print 100*$1/$2}'
echo "Triplet combination THT win percent = "
echo $tailheadtailwon $number | awk '{print 100*$1/$2}'
echo "Triplet combination TTH win percent = "
echo $tailtailheadwon $number | awk '{print 100*$1/$2}'
echo "Triplet combination TTT win percent = "
echo $tailtailtailwon $number | awk '{print 100*$1/$2}'