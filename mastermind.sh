#!/bin/bash

echo
echo Welcome to \"security\"
echo Please try to find the correct partial anagram of \"security\" to crack the code in 8 tries or less.
echo
echo

#readonly CODEPARTS = ('s','e','c','u','r','i','t','y')

#setCode(){
	num=$RANDOM
	firstChar=$(( $num / 4096 ))  
	(( num -= ($firstChar * 4096) ))
	secondChar=$(( $num / 512 ))
	(( num -= ($secondChar * 512) ))
	thirdChar=$(( $num / 64 ))
	(( num -= ($thirdChar * 64) ))
	fourthChar=$(( $num / 8 ))
	(( num -= ($fourthChar * 8) ))
	fifthChar=$num
	echo $secondChar
	echo $thirdChar
	echo $fourthChar
	echo $fifthChar
#}

#setCode

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
