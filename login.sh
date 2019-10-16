#!/bin/bash
printf "\n \n \n
           _____________________________
	  *  Welcome to MyCloud Login!  *
	  |_____________________________| "

printf "\n\n\n\nEnter the username: \n"
read name


printf "Enter Password:\n"
read pass 

#name and pass exported to auth.sh authentication script for login auth

export name pass
bash auth.sh

#echo "$name $pass"
	
