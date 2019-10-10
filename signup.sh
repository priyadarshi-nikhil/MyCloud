#!/bin/bash
echo "Welcome to MyCloud Sign Up!"
printf "\nEnter the email: \n"
read mail
printf "\nEnter the username: \n"
read name


printf "Enter Password:\n"
read pass 

# username is set as primary key, so duplicate user registration leads to reg. failure.

if mysql -u host -h 10.0.3.51 -p123456 -e "INSERT INTO mycloud.users(username, email, password) VALUES('$name', '$mail', '$pass');" ;then
	echo "Registered successfully!"
	./login.sh	
else
	echo "Registration Failure!"
fi
