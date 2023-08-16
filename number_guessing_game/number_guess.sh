#!/bin/bash

#Script that randomly generates a number that users have to guess.

PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

echo -e "\n~~~~~ Guess the number ~~~~~"

GUESS_FUNC(){
  read GUESS
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    TRIES=$((TRIES + 1 ))
    if [ $GUESS -lt $RANDOM_NUMBER ]
    then
      echo -e "\nIt's higher than that, guess again:"
      GUESS_FUNC
    elif [ $GUESS -gt $RANDOM_NUMBER ]
    then
      echo -e "\nIt's lower than that, guess again:"
      GUESS_FUNC
    else
      echo -e "\nYou guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
      INSERT_NUM_GUESSES=$($PSQL "INSERT INTO games(user_id, num_guesses) VALUES($USER_ID, $TRIES)")
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
    GUESS_FUNC
  fi
}

RANDOM_NUMBER=$((1 + $RANDOM % 1000))
TRIES=0

echo -e "\nEnter your username:"
read USERNAME
USERNAME_DB=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
# check if exists
if [[ -z $USERNAME_DB ]]
then
  INSERT_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  #if exists
  NUM_GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games JOIN users USING(user_id) WHERE username = '$USERNAME'")
  LOW_NUM_GUESSES=$($PSQL "SELECT MIN(num_guesses) FROM games JOIN users USING(user_id) WHERE username = '$USERNAME'")
  echo -e "\nWelcome back, $USERNAME! You have played $NUM_GAMES_PLAYED games, and your best game took $LOW_NUM_GUESSES guesses."
fi
echo -e "\nGuess the secret number between 1 and 1000:"
GUESS_FUNC
