#!/bin/bash

echo
echo Welcome to \"security\"
echo Please try to find the correct partial anagram of \"security\" to crack the code in 8 tries or less.
echo
echo



code=$( echo "security" | fold -w1 | shuf -n 5 | tr -d '\n' )
#echo $code
for ((try=0;try<=8; try++))
do	
	echo Try number $try
	echo Enter five letters from \"security\"
	read guess

	if [ $guess = $code ]
	then
		echo "Code Cracked!"
		break;
	fi

	match=0
	charInCode=0

	for ((i=0;i<5;i++))
	do
		for (( j=0; j<5;j++ ))
		do
			if [[ ${guess:$i:1} = ${code:$j:1} ]]
			then
				(( charInCode++ ))
				if [[ $i = $j ]] 
				then
					(( match++ ))
				fi
			fi
		done

	done
#	echo $code
	echo You have $match matching letters
	echo $charInCode of the letters you guessed exist in the code
done
