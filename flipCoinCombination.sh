#!/bin/bash

read -p "Enter number of trials : " trial
read -p "Enter maximum number of coin flips per turn : " coin

function flip(){
	val=$((RANDOM%2))
	if [[ $val -eq 0 ]]
	then 
		str="T"
	else
		str="H"
	fi
	echo $str
}

function maxout(){
	arr=("$@")
	max=0
	for i in ${!arr[@]}
	do
		if [ ${arr[$i]} -ge ${arr[$max]} ] 
		then
			max=$i
		fi
	done
	echo ${arr[$max]}
}

function analysis(){
	declare -A rev
	inp=("$@")
	for i in ${!inp[@]}
	do
		rev[${inp[$i]}]=$((${rev[${inp[$i]}]}+1))		
	done
	maximum=$(maxout "${rev[@]}")
	for i in ${!rev[@]}
	do
		echo "Win percent for $i = "
		echo ${rev[$i]} ${#inp[@]} | awk '{print 100*$1/$2}'
		if [[ ${rev[$i]} -eq $maximum ]]
		then 
			k=$i		
		fi
	done
	echo "Maximum draws were for $k"
}

declare -A results

for ((i=1;i<=$coin;i++))
do
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "Simulation results for $i coin flip"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	for ((j=1;j<=$trial;j++))
	do
		trailres=""
		for ((k=1;k<=$i;k++))
		do
			flipres=$(flip)
			trailres="$trailres$flipres"
		done
		results[$j]=$trailres
	done
	echo "Results of simulation with $i flips per turn : "${results[@]}
	(analysis "${results[@]}")
done