#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ Welcome to the Salon ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  #get list of services
  SERVICE_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  # display services
  echo -e "\nWelcome to my salon, how can I help you?"
  echo "$SERVICE_LIST" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  SERVICE_SELECTION=$($PSQL "SELECT service_id, name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_SELECTION ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    # if customers doesn't exist
    if [[ -z $CUSTOMER_NAME ]]
    then
      # get new customer name
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/^[^|]*| *//'), $CUSTOMER_NAME?"
      read SERVICE_TIME
      INSERT_SERVICE_TIME=$($PSQL "INSERT INTO appointments(time, service_id, customer_id) SELECT '$SERVICE_TIME', $SERVICE_ID_SELECTED, customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
      if [[ $INSERT_SERVICE_TIME == "INSERT 0 1" ]]
        then
        TIME_FORMATTED=$(echo $SERVICE_SELECTION | sed 's/^[^|]*| *//')
        echo -e "I have put you down for a $TIME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME."
      fi  
    else
      #ask directly for time
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/^[^|]*| *//'), $CUSTOMER_NAME?"
      read SERVICE_TIME
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      INSERT_SERVICE_TIME=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      if [[ $INSERT_SERVICE_TIME == "INSERT 0 1" ]]
      then
        TIME_FORMATTED=$(echo $SERVICE_SELECTION | sed 's/^[^|]*| *//')
        echo -e "I have put you down for a $TIME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
    fi  
  fi
} 

MAIN_MENU
