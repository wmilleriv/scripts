#!/bin/bash

echo
echo Welcome to \"security\"
echo Please try to find the correct partial anagram of \"security\" to crack the code in 8 tries or less.
echo
echo

readonly CODEPARTS=('s' 'e' 'c' 'u' 'r' 'i' 't' 'y')

setCode(){
	num=$RANDOM
	firstNum=$(( $num / 4096 ))  
	(( num -= ($firstNum * 4096) ))
	secondNum=$(( $num / 512 ))
	(( num -= ($secondNum * 512) ))
	thirdNum=$(( $num / 64 ))
	(( num -= ($thirdNum * 64) ))
	fourthNum=$(( $num / 8 ))
	(( num -= ($fourthNum * 8) ))
	fifthNum=$num
}

setCode

for ((try=1;try<=8; try++))
do	
	echo Try number $try
	echo Enter five letters from \"security\"
	read guess

	if [ $guess = $solution ]
	then
		echo "Code Cracked!"
		break;
	fi
done
