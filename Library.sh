#!/usr/bin/bash

addGuess(){
    guessCount=$((guessCount + $1))
}

function addHeads(){
    headsCount=$((headsCount + 1))
}

function addTails(){
    tailsCount=$((tailsCount + 1))
}

function addRocks(){
    rockCount=$((rockCount + 1))
}

function addPapers(){
    paperCount=$((paperCount + 1))
}

function addScissors(){
    scissorsCount=$((scissorsCount + 1))
}