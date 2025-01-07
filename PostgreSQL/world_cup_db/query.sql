-- WorldCup database
Complete the tasks below

You should create a database named worldcup

You should connect to your worldcup database and then create teams and games tables

Your teams table should have a team_id column that is a type of SERIAL and is the primary key, and a name column that has to be UNIQUE

Your games table should have a game_id column that is a type of SERIAL and is the primary key, a year column of type INT, and a round column of type VARCHAR

Your games table should have winner_id and opponent_id foreign key columns that each reference team_id from the teams table

Your games table should have winner_goals and opponent_goals columns that are type INT

All of your columns should have the NOT NULL constraint

Your two script (.sh) files should have executable permissions. Other tests involving these two files will fail until permissions are correct. When these permissions are enabled, the tests will take significantly longer to run

When you run your insert_data.sh script, it should add each unique team to the teams table. There should be 24 rows

When you run your insert_data.sh script, it should insert a row for each line in the games.csv file (other than the top line of the file). There should be 32 rows. Each row should have every column filled in with the appropriate info. Make sure to add the correct IDs from the teams table (you cannot hard-code the values)

You should correctly complete the queries in the queries.sh file. Fill in each empty echo command to get the output of what is suggested with the command above it. Only use a single line like the first query. The output should match what is in the expected_output.txt file exactly, take note of the number of decimal places in some of the query results

queries:

create database worldcup;
\c worldcup;

create table teams(
    team_id serial primary key, 
    name varchar(20) unique not null);

                                      Table "public.teams"
 Column  |         Type          | Collation | Nullable |                Default                 
---------+-----------------------+-----------+----------+----------------------------------------
 team_id | integer               |           | not null | nextval('teams_team_id_seq'::regclass)
 name    | character varying(20) |           | not null | 
Indexes:
    "teams_pkey" PRIMARY KEY, btree (team_id)
    "teams_name_key" UNIQUE CONSTRAINT, btree (name)

create table games(
    game_id serial primary key, 
    year int not null, 
    round varchar(20) not null, 
    winner_id int not null, 
    opponent_id int not null, 
    winner_goals int not null, 
    opponent_goals int not null, 
    foreign key(winner_id) references teams(team_id), 
    foreign key(opponent_id) references teams(team_id));

                                          Table "public.games"
     Column     |         Type          | Collation | Nullable |                Default                 
----------------+-----------------------+-----------+----------+----------------------------------------
 game_id        | integer               |           | not null | nextval('games_game_id_seq'::regclass)
 year           | integer               |           | not null | 
 round          | character varying(20) |           | not null | 
 winner_id      | integer               |           | not null | 
 opponent_id    | integer               |           | not null | 
 winner_goals   | integer               |           | not null | 
 opponent_goals | integer               |           | not null | 
Indexes:
    "games_pkey" PRIMARY KEY, btree (game_id)
Foreign-key constraints:
    "games_opponent_id_fkey" FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
    "games_winner_id_fkey" FOREIGN KEY (winner_id) REFERENCES teams(team_id)

-- Bash Commands
-- Giving executable permission to insert_data.sh and queries.sh 
$> chmod +x insert_data.sh 
$> chmod +x queries.sh 

-- Queries
Total number of goals in all games from winning teams:
SELECT SUM(winner_goals) FROM games;

Total number of goals in all games from both teams combined:
select sum(winner_goals)+sum(opponent_goals) from games;

Average number of goals in all games from the winning teams:
select avg(winner_goals) from games;

Average number of goals in all games from the winning teams rounded to two decimal places:
select round(avg(winner_goals), 2) from games;

Average number of goals in all games from both teams:
select avg(winner_goals + opponent_goals) from games;

Most goals scored in a single game by one team:
select max(winner_goals) from games;

Number of games where the winning team scored more than two goals:
select count(*) from games where winner_goals > 2;

Winner of the 2018 tournament team name:
select name from games join teams on games.winner_id = teams.team_id where year = 2018 and round = 'Final';

List of teams who played in the 2014 'Eighth-Final' round:
select name from games join teams on games.winner_id = teams.team_id or games.opponent_id = teams.team_id where year = 2014 and round = 'Eighth-Final' order by name;

List of unique winning team names in the whole data set:
select distinct(name) from games join teams on games.winner_id = teams.team_id order by name;

Year and team name of all the champions:
select year,name from games join teams on games.winner_id = teams.team_id where round = 'Final' order by year;

List of teams that start with 'Co':
select name from teams where name like 'Co%' order by name;