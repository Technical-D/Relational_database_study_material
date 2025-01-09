#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

# Function for the number guessing game
game() {
  secret_number=$(( RANDOM % 1000 + 1 ))
  echo "Guess the secret number between 1 and 1000:"
  read guess
  game_end='false'
  guess_num=0
  while [[ $game_end == 'false' ]]
  do
    if [[ $guess =~ ^[0-9]+$ ]]  # Check if input is an integer
    then
      if [[ $guess == $secret_number ]]
      then
        insert_game_result=$($PSQL "insert into games(user_id,guesses) values($user_id, $guess_num);")
        echo "You guessed it in $guess_num tries. The secret number was $secret_number. Nice job!"
        game_end='true'
      elif [[ $guess -gt $secret_number ]]
      then
        echo "It's lower than that, guess again:"
        read guess
      elif [[ $guess -lt $secret_number ]]
      then
        echo "It's higher than that, guess again:"
        read guess
      fi
      ((guess_num++))
    else
      echo "That is not an integer, guess again:"
      read guess
    fi
  done
}

# Prompt the user for their username
echo "Enter your username:"
read username

# Check if the user already exists in the database
user_id=$($PSQL "select user_id from users where username='$username';")
if [[ -z $user_id ]]
then
  insert_user_result=$($PSQL "insert into users(username) values('$username');")
  echo "Welcome, $username! It looks like this is your first time here."
  user_id=$($PSQL "select user_id from users where username='$username';")
  game
else
  no_of_game=$($PSQL "select count(*) from games where user_id=$user_id;")
  best_game=$($PSQL "select min(guesses) from games where user_id=$user_id;")
  no_of_game=$(echo $no_of_game | xargs)
  best_game=$(echo $best_game | xargs)
  echo "Welcome back, $username! You have played $no_of_game games, and your best game took $best_game guesses."
  game
fi
