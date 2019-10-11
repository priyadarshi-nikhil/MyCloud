#!/bin/bash
user=$(mysql -u host -h 10.0.3.51 -p123456 -e "SELECT username from mycloud.users where username='$name';")

name=$(echo $user | sed 's/[^ ]* *//')
printf "\n\n\nHi! "$name"   \n\n\n"

echo "Press:"
echo 	"0. Your MyCloud Directory."
echo 	"1. View Account information."
echo 	"2. Buy/Upgrade Subscription."
echo 	"3. Buy/Upgrade Backup plan."
echo 	"4. Buy/Upgrade Storage plan."
echo 	"5. Smart-View Mode."
echo 	"6. Restore backup to local system."

read choice
export name choice
case "$choice" in
				0) ./mycloud.sh ;;
				1) ./ac_info.sh ;;
				2) ./subs.sh ;;
				3) ./backup.sh ;;
				4) ./storage.sh ;;
				5) ./sview.sh ;;
				6) ./restore.sh ;; 
				*) 	echo "You entered something else." ;;
			esac

