#!/bin/bash

#flatten grid into single array
#     A1   B1  C1  A2  B2  C2  A3  B3  C3
grid=(" " " " " " " " " " " " " " " " " ")
gridLabel=("A1" "B1" "C1" "A2" "B2" "C2" "A3" "B3" "C3")
#assign each space a prime number so board can be calculated from products
gridKey=(2 3 5 7 11 13 17 19 23) 

function showGrid () {
	echo "   A  B  C  "
	echo " 1  ${grid[0]}|${grid[1]}|${grid[2]}   "
	echo "   -------  "
	echo " 2  ${grid[3]}|${grid[4]}|${grid[5]}   "
	echo "   -------  "
	echo " 3  ${grid[6]}|${grid[7]}|${grid[8]}   "
}

showGrid
echo "Let's play Tic Tac Toe"
echo "Would you like to be X or O? "
read playerChar
if [ $playerChar = "X" ]
then
	compChar="O"
else
	compChar="X"
fi

function playerTurn() {
	echo "Pick a grid location to place your ${playerChar}" 
	read box
	for (( i=0;i<9;i++ ))
	do
		if [ $box = ${gridLabel[$i]} ] && [ ${grid[$i]}=" " ]
		then
			grid[$i]=$playerChar
			(( playerHash *= gridKey[$i] )) 
		elif [ ${grid[$i]} -ne  " " ]
		then
			echo "Invalid selection"
			playerTurn
		fi
	done
	showGrid
	computerTurn
}

function computerTurn() {
	#if first turn choose a corner, if not and middle is empty, choose middle
	if [[ ${grid[@]} = " " ]]
	then
		grid[0]=$compChar
		(( compHash *= gridKey[0] ))
	elif [[ ${grid[4]} = " " ]]
	then

		grid[4]=$compChar
		(( compHash *= gridKey[4] ))

	elif [[ !(($playerHash%6)) ]] && [[ gridKey[2] == " " ]]
	then
		grid[2]=$compChar
		(( compHash*=gridKey[2] ))
	
	elif [[ !(( $playerHash % 10 ))  ]] && [[ gridKey[1] == " " ]]
	then
		grid[2]=$compChar
		(( compHash*=gridKey[2] ))
	
	elif [[ !(( $playerHash % 15 )) ]] && [[ gridKey[0] == " " ]]
	then
		grid[2]=$compChar
		(( compHash*=gridKey[2] ))

	elif [[ !(( $playerHash % 77 ))  ]] && [[ gridKey[5] == " " ]]
	then
		grid[2]=$compChar
		(( compHash*=gridKey[2] ))
	elif [[ !(( $playerHash % 143 ))  ]] && [[ gridKey[3] == " " ]]
	then
		grid[2]=$compChar
		(( compHash*=gridKey[2] ))
	elif [[ !(( $playerHash % 323 ))  ]] && [[ gridKey[8] == " " ]]
	then
		grid[2]=$compChar
		(( compHash*=gridKey[2] ))

	elif [[ !(( $playerHash % 391 )) ]] && [[ gridKey[7] == " " ]]
	then
		grid[2]=$compChar
		(( compHash*=gridKey[2] ))
	elif [[ !(( $playerHash % 437 ))  ]] && [[ gridKey[6] == " " ]]
	then
		grid[2]=$compChar
		(( compHash*=gridKey[2] ))

	fi

	showGrid
	playerTurn
}
function rockPaperScissors() {
	echo "type r for rock, p for paper or s for scissors"
	read playerChoice

	computerChoice=$(( $RANDOM %3 ))
	echo $computerChoice

	if [ $computerChoice = 0 ]
	then
		echo "The computer chose rock"
		if [ $playerChoice = p ]
		then
			echo "Congratulations you won"
			playerTurn #function to be added later
		fi
		if [ $playerChoice = s ]
		then
			echo "The computer will go first"
			#computerTurn #function to be added
		fi
		if [ $playerChoice = r ]
		then
			echo "It's a tie. Try again"
			rockPaperScissors #put this in function and call again
		fi	

	fi	

	if [ $computerChoice = 1 ]
	then
		echo "The computer chose paper"
		if [ $playerChoice = s ]
		then
			echo "Congratulations you won"
			playerTurn #function to be added later
		fi
		if [ $playerChoice = r ]
		then
			echo "The computer will go first"
			#computerTurn #function to be added
		fi
		if [ $playerChoice = p ]
		then
			echo "It's a tie. Try again"
			rockPaperScissors #put this in function and call again
		fi	
	
	fi

	if [ $computerChoice = 2 ]
	then
		echo "The computer chose scissors"
		if [ $playerChoice = r ]
		then
			echo "Congratulations you won"
			playerTurn #function to be added later
		fi
		if [ $playerChoice = p ]
		then
			echo "The computer will go first"
			#computerTurn #function to be added
		fi
		if [ $playerChoice = s ]
		then
			echo "It's a tie. Try again"
			rockPaperScissors #put this in function and call again
		fi	
	
	fi

}

#rockPaperScissors


playerTurn

