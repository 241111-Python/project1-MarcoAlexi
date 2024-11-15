#!/usr/bin/bash

echo "Hello! Pick a game from the list!"

echo -e "1 - Rock, Paper, Scissors\n2 - Coin Flipper\n3 - Guess the number from 1-100"


read choice

# RPS
if [ $choice == 1 ]; then
    echo "You chose Rock, Paper, Scissors!"
    # Let's make 1 = rock, 2 = paper, 3 = scissors
    # Rock > scissors, scissors > papar, paper > rock,  

    # game start! 
    while true; 
    do
        compPlay=$(( RANDOM%3 + 1)) # computer move

        echo "Select a move - Rock (1), Paper (2) or Scissors? (3) or -1 to exit game"

        read userPlay

        if [ $userPlay == 1 ]; then # Rock 
            if [ $compPlay == 3 ]; then
                echo "You win with rock!"
                echo "rock" >> "rpsOutput.txt"
            elif [ $compPlay == 2 ]; then
                echo "You lose with rock :("
            fi
        elif [ $userPlay == 2 ]; then # paper
            if [ $compPlay == 1 ]; then
                echo "You win with paper!"
                echo "paper" >> "rpsOutput.txt"
            elif [ $compPlay == 3 ]; then
                echo "You lose with papar :("
            fi
        elif [ $userPlay == 3 ]; then # scissors
            if [ $compPlay == 2 ]; then
                echo "You win with scissors!"
                echo "scissors" >> "rpsOutput.txt"
            elif [ $compPlay == 1 ]; then
                echo "You lose wth scissors :("
            fi
        elif [ $userPlay == -1 ]; then # Exit
            break
        else # incorrect selection
            echo -e "You didn't select a correct number!\nSelect either 1, 2 or 3"
        fi
        
        if [ $userPlay == $compPlay ]; then # Same play
            echo "Tie! Try again."
        fi
        echo "------------------------------------"
    done
    
elif [ $choice == 2 ]; then  # Coin Flipper!!
    echo "Coin Flipper!"
    
    while true; 
    do
        coinFlip=$(( RANDOM%2 )) # head = 0, tails = 1 
        
        if [ $coinFlip == 0 ]; then
            echo "Heads!"
            echo "heads" >> "coinflipOutput.txt"
        else
            echo "Tails!"
            echo "tails" >> "coinflipOutput.txt"
        fi

        read -p "Again? (Y/N) " flipAgain
        if [ $flipAgain == "N" ] || [ $flipAgain == "n" ]; then
            break
        fi
        echo "------------------------------------"
    done    
elif [ $choice == 3 ]; then # Guess the number 
    echo "Guessing Game!"
    guessNumber=$((RANDOM % 100 + 1)) # 1-100 range generator
    counter=0
    while true;
    do
        read -p "Guess the number!(1-100) " userNum 
        counter=$((counter + 1))

        if [ $guessNumber == $userNum ]; then
            echo "You guessed the number $guessNumber correctly!"
            echo $counter >> "guessOutput.txt" 
            break
        else
            if [ $guessNumber -gt $userNum ]; then
                echo "Higher!"
            else
                echo "Lower!"
            fi
            echo "------------------------------------"
        fi
    done
else # exit for false choice
    echo "Didn't choose a correct option! Goodbye"
fi

echo "Thanks for playing!"
