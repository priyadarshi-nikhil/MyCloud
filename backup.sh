#!/bin/bash

plan=$(mysql -u host -h MariaDB-lxc.mycloud.com -p123456 -e "SELECT backup from mycloud.info where username='$name';")

plan=$(echo $plan | sed 's/[^ ]* *//')
printf "\n\n\nHi! "$name"   \n\n\n"
echo "you have a $plan backup subscription."
echo

if [ "$plan" = "manual" ]; then
	echo "...press 1 to take backup now..."
	read ch
	if [ "$ch" -eq 1 ];then
		./backupScript.sh
	else
		echo "...Exiting..."
		./landing.sh
	fi
fi
