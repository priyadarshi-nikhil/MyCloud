#!/bin/bash
echo "Welcome to MyCloud Sign Up!"
printf "\nEnter the email: \n"
read mail
printf "\nEnter the username: \n"
read name


printf "Enter Password:\n"
read pass 
export mail name pass
# username is set as primary key, so duplicate user registration leads to reg. failure.

if mysql -u host -h MariaDB-lxc.mycloud.com -p123456 -e "INSERT INTO mycloud.users(username, email, password) VALUES('$name', '$mail', '$pass');" ;then
	echo "Registered successfully!"
	printf "\n $(date): $name Registered. <br>" | ssh root@10.0.3.34 "cat >> /var/www/html/userLogs.html"
	./buyPlans.sh	
else
	echo "Registration Failure!"
fi


