echo "Hello! Pick a game from the list!"

echo -e "1 - Rock, Paper, Scissors\n2 - Coin Flipper\n3 - Guess the number from 1-6"


read choice

# RPS
if [ $choice = 1 ]; then
    echo -e "You chose Rock, Paper, Scissors!\nSelect a move - Rock, Paper or Scissors?"
    # Let's make 0 = rock, 1 = paper, 2 = scissors
    # Rock > scissors, scissors > papar, paper > rock,  

    # game start! 
    while [ true ]
    do 
        read userPlay

        compPlay=$(( RANDOM%3 ) + 1)

        if [ $userPlay = 1 ]; then # Rock 
            case $compPlay in
                3)
                    echo "You win!"
                    ;;
                2)
                    echo "You lose :("
                    ;;
            esac
            break;
        elif [ $userPlay = 2 ]; then # paper
            case $compPlay in
                1)
                    echo "You win!"
                    ;;
                3)
                    echo "You lose :("
                    ;;
            esac
            break;
        elif [ $userPlay = 3 ]; then # scissors
            case $compPlay in
                2)
                    echo "You win!"
                    ;;
                1)
                    echo "You lose :("
                    ;;
            esac
            break;
        else
            echo -e "You didn't select a correct number!\nSelect either 0, 1 or 2"
        fi
        
        if [ $userPlay = compPlay ]; then
            echo "Tie! Try again."
        fi
    done
    
    echo "Thanks for playing!"

elif [ $choice = 2 ]; then 
    echo "Coin Flipper!"

    
    while true; 
    do
        coinFlip=$(( RANDOM%2 ))
        
        if [ $coinFlip = 0 ]; then
            echo "Heads!"
        else
            echo "Tails!"
        fi

        read -p "Again? (Y/N) " flipAgain
        if [ $flipAgain = "N" ]; then
            break
        fi
    done    
elif [ $choice = 3 ]; then 
    echo -e "Guessing game!\nPick a number from 1-5"
    
    while true;
    do
        guessNumber=$((RANDOM % 5 + 1))

        read -p "Guess the number!(1-5) " userNum 

        if [ $guessNumber = $userNum ]; then
            echo "You guessed correctly!"
        else
            echo "You guessed incorrectly :("
        fi

        read -p "Guess again? (Y/N) " guessAgain
        if [ $guessAgain = "N" ]; then
            break
        fi        
    done
else
    echo "Didn't choose a correct option! Goodbye"
fi

echo "Thanks for playing!"
