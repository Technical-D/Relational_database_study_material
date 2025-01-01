-- shows list of databases
\l

-- connect to desired database
\c db_name

-- shows list of tables avialble
\d

-- shows details of the table
\d tb_name

-- create database
create database db_name;

-- query for creatinf tables
create table person(
    id SERIAL PRIMARY KEY, 
    name VARCHAR(20) UNIQUE NOT NULL, 
    age INT, 
    height NUMERIC(4,1), 
    is_alive BOOLEAN DEFAULT TRUE, 
    bio TEXT, 
    birthday_date DATE);

-- Datatypes
INT 
NUMERIC
VARCHAR 
TEXT
SERIAL
DATE
BOOLEAN

-- contraints
SERIAL 
NOT NULL
UNIQUE
PRIMARY KEY
FOREIGN KEY
DEFAULT
AUTO_INCREMENT -- FOR MYSQL

-- Creating a table with foreign key
create table person_info(
    info_id SERIAL PRIMARY KEY, 
    weight NUMERIC(4,1) NOT NULL,address TEXT, 
    hobbies VARCHAR(30), 
    id INT UNIQUE NOT NULL, 
    FOREIGN KEY(id) REFERENCES person(id));

-- Each person has a unique record in person_info, establishing a one-to-one relationship; hence, the foreign key must be unique.

-- Inserting data into tables
insert into person(name, age, height, is_alive, bio, birthday_date) values('Dheeraj', 21, 5.6, true, 'focuesd individual', '2003-02-14');

-- Inserting Data into Tables Without Specifying Column Names:
-- When inserting data, ensure that the values are provided in the same order as the columns in the table to prevent errors. Additionally, avoid manually assigning an ID when using the SERIAL type for the id column, as this may lead to errors due to the automatic incrementing behavior.
insert into person values(2,'Jayhind', 22, 5.5, true, 'anime lover', '2003-02-20');

