#!/bin/bash
user=$(mysql -u host -h MariaDB-lxc.mycloud.com -p123456 -e "SELECT username from mycloud.users where username='$name';")

name=$(echo $user | sed 's/[^ ]* *//')
printf "\n\n\nHi! "$name"   \n\n\n"


echo "Press:"
echo 	"0. Your MyCloud Directory."
echo 	"1. View Account information."
echo 	"2. Backups"
echo 	"3. Smart-View Mode."
#echo 	"4. Restore backup to local system."

read choice
export name choice
case "$choice" in
				0) ./mycloud.sh ;;
				1) ./ac_info.sh ;;
				2) ./backup.sh ;;
				3) ./sview.sh ;;
				#4) ./restore.sh ;; 
				*) 	echo "You entered something else." ;;
			esac

