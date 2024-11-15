#!/usr/bin/bash

rpsOutput="rpsOutput.txt"
guessOutput="guessOutput.txt"
coinflipOutput="coinflipOutput.txt"


rockCount=0
paperCount=0
scissorsCount=0

headsCount=0
tailsCount=0

guessCount=0


# reading RPS file
while IFS=\n read -r play; do
    if [ $play == "rock" ]; then
        rockCount=$((rockCount + 1))
    elif [ $play == "paper" ]; then
        paperCount=$((paperCount + 1))
    elif [ $play == "scissors" ]; then
        scissorsCount=$((scissorsCount + 1))
    fi
done < "$rpsOutput"


# reading coinflip file
while IFS=\n read -r flip; do
    if [ $flip == "heads" ]; then
        headsCount=$((headsCount + 1))
    else
        tailsCount=$((tailsCount + 1))
    fi
done < "$coinflipOutput"

# reading guessing game file
while IFS=\n read -r guess; do
    guessCount=$((guessCount + guess))
done < "$guessOutput"

rpsLineCnt=$(wc -l < $rpsOutput)
coinflipLineCnt=$(wc -l < $coinflipOutput)
guessLineCnt=$(wc -l < $guessOutput)


# Calculations
rockPercent=$(($rockCount * 100 / $rpsLineCnt))
paperPercent=$(($paperCount * 100 / $rpsLineCnt))
scissorsPercent=$(($scissorsCount * 100 / $rpsLineCnt))
headsPercent=$(($headsCount * 100 / $coinflipLineCnt))
tailsPercent=$(($tailsCount * 100 / $coinflipLineCnt))
guessAverage=$(($guessCount / $guessLineCnt))

# RPS
echo "Rock, Paper, Scissors Statistics!"
echo "Total RPS matches: $rpsLineCnt"
echo "Total rock wins: $rockCount"
echo "Total paper wins: $paperCount"
echo "Total scissors wins: $scissorsCount"

echo "Of the winning games..."
echo "Rock winrate: $rockPercent%" 
echo "Paper winrate: $paperPercent%" 
echo "Scissors winrate: $scissorsPercent%" 


# Coin Flipper
echo "Coin Flips Statistics!"
echo "Total coinflips: $coinflipLineCnt"
echo "Total head flips: $headsCount"
echo "Total tail flips: $tailsCount"
echo "Head flips percent: $headsPercent%"
echo "Tail flips percent: $tailsPercent%"

# Guessing Game!
echo "Guessing Game Statistics!"
echo "Total guessing games played: $guessLineCnt"
echo "Total guesses: $guessCount"
echo "Average guess per game: $guessAverage"