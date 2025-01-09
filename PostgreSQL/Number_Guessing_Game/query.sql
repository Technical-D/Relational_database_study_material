Create a number_guessing_game folder in the project folder for your program

Create number_guess.sh in your number_guessing_game folder and give it executable permissions

Your script should have a shebang at the top of the file that uses #!/bin/bash

Turn the number_guessing_game folder into a git repository

Your git repository should have at least five commits

Your script should randomly generate a number that users have to guess

When you run your script, you should prompt the user for a username with Enter your username:, and take a username as input. Your database should allow usernames that are 22 characters

If that username has been used before, it should print Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses., with <username> being a users name from the database, <games_played> being the total number of games that user has played, and <best_game> being the fewest number of guesses it took that user to win the game

If the username has not been used before, you should print Welcome, <username>! It looks like this is your first time here.

The next line printed should be Guess the secret number between 1 and 1000: and input from the user should be read

Until they guess the secret number, it should print Its lower than that, guess again: if the previous input was higher than the secret number, and Its higher than that, guess again: if the previous input was lower than the secret number. Asking for input each time until they input the secret number.

If anything other than an integer is input as a guess, it should print That is not an integer, guess again:

When the secret number is guessed, your script should print You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job! and finish running

The message for the first commit should be Initial commit

The rest of the commit messages should start with fix:, feat:, refactor:, chore:, or test:

You should finish your project while on the main branch, your working tree should be clean, and you should not have any uncommitted changes

-- Queries
create database number_guess;

create table users(user_id serial primary key, username varchar(22) unique not null);

\d users;
                                       Table "public.users"
  Column  |         Type          | Collation | Nullable |                Default                 
----------+-----------------------+-----------+----------+----------------------------------------
 user_id  | integer               |           | not null | nextval('users_user_id_seq'::regclass)
 username | character varying(22) |           | not null | 
Indexes:
    "users_pkey" PRIMARY KEY, btree (user_id)
    "users_username_key" UNIQUE CONSTRAINT, btree (username)


create table games(game_id serial primary key, guesses int not null, user_id int not null, foreign key(user_id) references users(user_id));
CREATE TABLE

\d games;
Table "public.games"
 Column  |  Type   | Collation | Nullable |                Default                 
---------+---------+-----------+----------+----------------------------------------
 game_id | integer |           | not null | nextval('games_game_id_seq'::regclass)
 guesses | integer |           | not null | 
 user_id | integer |           | not null | 
Indexes:
    "games_pkey" PRIMARY KEY, btree (game_id)
Foreign-key constraints:
    "games_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(user_id)
