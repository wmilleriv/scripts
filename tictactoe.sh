#!/bin/bash


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
			#playerTurn #function to be added later
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
			#playerTurn #function to be added later
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
			#playerTurn #function to be added later
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


echo "   A  B  C  "
echo " 1   | |    "
echo "   -------  "
echo " 2   | |    "
echo "   -------  "
echo " 3   | |    "


echo "Let's play Tic Tac Toe"
rockPaperScissors

