#!/bin/bash

echo "enter otp"
read otp
if [ "$otp" -eq 1234 ] ; then
	$(mysql -u host -h 10.0.3.51 -p123456 -e "INSERT INTO mycloud.info(username,subscription, backup, storage) VALUES('$name', '$sub', '$bkup', '$storage')";)
	lxc-attach -n cloud-lxc -- useradd -m -s /bin/bash $name
	
	
else
	echo "payment failed"
fi
