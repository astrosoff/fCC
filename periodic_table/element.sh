#!/bin/bash

# Script to get info about elements of the periodic table.
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# check if there is an argument
if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  # get data from db based on argument
  if [[ $1 =~ ^[0-9]+$ ]] 
  then
    ATOMIC_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
  else
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$1'")
    NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1'")
  fi
  # get data from db based on found variable
  if [[ $1 == $ATOMIC_NUM ]]
  then
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $1")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $1")
    TYPE=$($PSQL "SELECT type FROM types JOIN properties USING (type_id) WHERE atomic_number = $1")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $1")
    MELT_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $1")
    BOIL_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $1")
    echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
  elif [[ $1 == $SYMBOL ]]
  then
    ATOMIC_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
    NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$1'")
    TYPE=$($PSQL "SELECT type FROM types JOIN properties USING (type_id) JOIN elements USING (atomic_number) WHERE symbol = '$1'")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties JOIN elements USING (atomic_number) WHERE symbol = '$1'")
    MELT_POINT=$($PSQL "SELECT melting_point_celsius FROM properties JOIN elements USING (atomic_number) WHERE symbol = '$1'")
    BOIL_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties JOIN elements USING (atomic_number) WHERE symbol = '$1'")
    echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
  elif [[ $1 == $NAME ]]
  then
    ATOMIC_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$1'")
    TYPE=$($PSQL "SELECT type FROM types JOIN properties USING (type_id) JOIN elements USING (atomic_number) WHERE name = '$1'")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties JOIN elements USING (atomic_number) WHERE name = '$1'")
    MELT_POINT=$($PSQL "SELECT melting_point_celsius FROM properties JOIN elements USING (atomic_number) WHERE name = '$1'")
    BOIL_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties JOIN elements USING (atomic_number) WHERE name = '$1'")
    echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
  else
    echo "I could not find that element in the database."
  fi
fi