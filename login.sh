#!/bin/bash
echo "Welcome to MyCloud Login!"
printf "\nEnter the username: \n"
read name


printf "Enter Password:\n"
read pass 

#name and pass exported to auth.sh authentication script for login auth

export name pass
./auth.sh

#echo "$name $pass"
