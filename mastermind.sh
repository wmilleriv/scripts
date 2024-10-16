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

	code=${CODEPARTS[$firstNum]}${CODEPARTS[$secondNum]}${CODEPARTS[$thirdNum]}${CODEPARTS[$fourthNum]}${CODEPARTS[$fifthNum]}


}
setCode

for ((try=1;try<=8; try++))
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

	for ((i=1;i<=5;i++))
	do
		if [ ${guess:$i:1} = ${code:$i:1} ]
		then
			(( match++ ))
		fi
		for (( j=1;j<=5;j++))
		do
			if [ ${guess:$i:1} = ${code:$j:1} ]
			then
				(( charInCode++ ))
			fi
		done

	done
	echo $code
	echo You have $match matching letters
	echo $charInCode of the letters you guessed exist in the code
done
