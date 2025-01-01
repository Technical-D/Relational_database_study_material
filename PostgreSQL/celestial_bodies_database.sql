-- Complete the tasks below
-- Connecting to postgres database in Linux
psql --username=freecodecamp --dbname=postgres

-- You should create a database named universe
create database universe;

-- Be sure to connect to your database with \c universe. Then, you should add tables named galaxy, star, planet, and moon
\c universe;

create table galaxy( galaxy_id serial primary key, name varchar(30) unique not null,age_in_million_of_years int not null, description text,has_life boolean default false, distance_from_earth int, galaxy_type varchar(20));

create table star(star_id serial primary key, name varchar(30) unique not null, age_in_millions_of_years int not null, has_life boolean default false, distance_from_earth int, description text, galaxy_id int not null, foreign key(galaxy_id) references galaxy(galaxy_id));

create table planet(planet_id serial primary key, name varchar(30) unique not null, description text, distance_from_earth int, age_in_millions_of_years int not null, has_life boolean default false, is_spherical boolean default false,star_id int not null, foreign key(star_id) references star(star_id));

create table moon(moon_id serial primary key, name varchar(30) unique not null, description text, is_spherical boolean default false, age_in_millions_of_years int not null, distance_from_earth numeric(4,1), planet_id int not null, foreign key(planet_id) references planet(planet_id));

 insert into galaxy(name, age_in_million_of_years, description, galaxy_type) values('Milky Way', 1000, 'Our home galaxy, a barred
spiral galaxy containing our solar system', 'Barred Spiral');

insert into galaxy(name, age_in_million_of_years, description, galaxy_type) values('Andromeda', 1200, 'closest spiral galaxy to the Milky Way', 'Spiral'), ('Triangulum Galaxy', 1300, 'member of the Local Group', 'Spiral'), ('Sombrero Galaxy', 1400, 'Famous for its bright central bulge', 'Lenticular'), ('Whirlpool Galaxy', 700, 'galaxy with prominent arms', 'Spiral'), ('Large Magellanic Cloud', 4300, 'satellite galaxy', 'Irregular');

insert into planet(name, age_in_millions_of_years, star_id) values('Mercury', 4500, 1), ('Venus', 4500, 2), ('Mars', 450, 3), ('Jupiter', 500, 1), ('Saturn',4500, 1), ('Uranus', 1200, 1), ('Neptune', 340, 2), ('Pluto', 459, 3), ('Kepler-22b', 4600, 5), ('Proxima', 56, 4), ('Titan', 340, 6);

create table asteroid(asteroid_id serial primary key, name varchar(20) unique not null,description text,asteroid_type varchar(20)
);

insert into asteroid(name, description) values('Ceres', 'largest asteroid'), ('Vesta', ' second-largest asteroid'), ('Eros', 'near-Earth asteroid');


Complete the tasks below

You should create a database named universe

Be sure to connect to your database with \c universe. Then, you should add tables named galaxy, star, planet, and moon

Each table should have a primary key

Each primary key should automatically increment

Each table should have a name column

You should use the INT data type for at least two columns that are not a primary or foreign key

You should use the NUMERIC data type at least once

You should use the TEXT data type at least once

You should use the BOOLEAN data type on at least two columns

Each "star" should have a foreign key that references one of the rows in galaxy

Each "planet" should have a foreign key that references one of the rows in star

Each "moon" should have a foreign key that references one of the rows in planet

Your database should have at least five tables

Each table should have at least three rows

The galaxy and star tables should each have at least six rows

The planet table should have at least 12 rows

The moon table should have at least 20 rows

Each table should have at least three columns

The galaxy, star, planet, and moon tables should each have at least five columns

At least two columns per table should not accept NULL values

At least one column from each table should be required to be UNIQUE

All columns named name should be of type VARCHAR

Each primary key column should follow the naming convention table_name_id. For example, the moon table should have a primary key column named moon_id