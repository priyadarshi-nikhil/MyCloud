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

	
	
else
	echo "payment failed"
fi
