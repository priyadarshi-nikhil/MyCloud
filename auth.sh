#!/bin/bash
 
#echo "printing from auth"
#echo "$name $pass"
#n=$name
#echo $n

#result of mysql query stored in output
output=$(mysql -u host -h 10.0.3.51 -p123456 -e "SELECT username,password from mycloud.users where username='$name' AND password='$pass';")

#the output variable will have only one line if credentials are correct. As username is the primary key so there is no way multiple lines are #received as output. Also it matches the password. In case of wrong credentials, a empty line is stored in output. In this case also the line #count is 1. So check if the line is not empty.

#echo $output
if [ -n "$output" ] && [ "$(echo $output | wc -l)" -eq 1 ];then
	echo "Logged In"
else
	echo "Login Failed!"
fi

#r=$(echo $output | wc -l) 
#echo $r


#if [ "$r" -eq 1 ] && [ -n "$r" ]; then
#	echo "Logged in"
#else
#	echo "Login Failed!"
#fi