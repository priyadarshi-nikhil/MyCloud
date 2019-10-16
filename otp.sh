#!/bin/bash

echo "enter otp"
read otp
if [ "$otp" -eq 1234 ] ; then
	$(mysql -u host -h 10.0.3.51 -p123456 -e "INSERT INTO mycloud.info(username,subscription, backup, storage) VALUES('$name', '$sub', '$bkup', '$storage')";)
	if [ "$choice1" -eq 1 ];then 
		lxc-attach -n cloud-lxc -- useradd -m -s /bin/bash -e $(date -d "$(date +%Y-%m-%d) 1 month" +%Y-%m-%d) $name
	fi
	if [ "$choice1" -eq 2 ];then 
		lxc-attach -n cloud-lxc -- useradd -m -s /bin/bash -e $(date -d "$(date +%Y-%m-%d) 1 year" +%Y-%m-%d) $name
	fi


	if [ "$choice2" -eq 1 ];then 
		cp backupScript.sh /etc/cron.hourly
	fi
	if [ "$choice2" -eq 2 ];then 
		cp backupScript.sh /etc/cron.daily
	fi
	if [ "$choice2" -eq 3 ];then 
		cp backupScript.sh /etc/cron.weekly
	fi

	echo "Redirecting to login page..."
	sleep 5s
	./login.sh
	
else
	echo "payment failed...Enter otp again.."
	./signup.sh

fi


