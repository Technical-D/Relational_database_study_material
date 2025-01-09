#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
print_element() {
  echo "$element_result" | while IFS=" | " read type_id an mass melting boiling symbol name type
  do
    echo "The element with atomic number $an is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melting celsius and a boiling point of $boiling celsius."
  done
}

if [[ $1 ]]
then
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    element_result=$($PSQL "select * from properties inner join elements using(atomic_number) inner join types using(type_id) where symbol='$1' or name='$1';")
    if [[ -z $element_result ]]
    then
      echo "I could not find that element in the database."
    else
      print_element $element_result
    fi
  else
    element_result=$($PSQL "select * from properties inner join elements using(atomic_number) inner join types using(type_id) where atomic_number = $1;")
    if [[ -z $element_result ]]
    then
      echo "I could not find that element in the database."
    else
      print_element $element_result
    fi
  fi
else
  echo "Please provide an element as an argument."
fi
