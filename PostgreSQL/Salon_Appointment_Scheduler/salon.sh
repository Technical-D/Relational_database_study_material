#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"
main_menu() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  services=$($PSQL "select * from services;")
  echo "$services" | while read id bar service
  do
    echo "$id) $service"
  done
  book_appointment
}

book_appointment() {
  read SERVICE_ID_SELECTED
  SELECTED_SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED;")
  if [[ -z $SELECTED_SERVICE_NAME ]]
  then
    main_menu "I could not find that service. What would you like today?"
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE';")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      insert_customer_result=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
    echo -e "\nWhat time would you like your $(echo $SELECTED_SERVICE_NAME | sed -E 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')?"
    read SERVICE_TIME
    insert_appointment_result=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
    echo -e "\nI have put you down for a $(echo $SELECTED_SERVICE_NAME | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
  fi

}
main_menu