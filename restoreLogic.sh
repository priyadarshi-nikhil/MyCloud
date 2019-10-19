#!/bin/bash

echo "Logic for restoring to a state from selected choice"

#echo $restfile

echo "	1. Merge"
echo "	2. Revert to selected state"
read rl 

if [ "$rl" -eq 1 ];then
	lxc-attach -n cloud-lxc -- scp /home/$name/$restfile root@10.0.3.1:/root/MyCloud/$name/ > /dev/null 2>&1
	mkdir -p /root/MyCloud/$name/tmp/
	tar -xf /root/MyCloud/$name/$restfile  -C /root/MyCloud/$name/tmp/ --strip-components=3
	mv /root/MyCloud/$name/tmp/* /root/MyCloud/$name/
	rm /root/MyCloud/$name/$restfile 
	rm -r /root/MyCloud/$name/tmp

	echo "....Merge Successful!"
	printf "\n $(date): $name Merged with $restfile. <br>" | ssh root@10.0.3.34 "cat >> /var/www/html/userLogs.html"
fi

if [ "$rl" -eq 2 ];then
	touch /root/MyCloud/$name/tmp
	rm /root/MyCloud/$name/*
	lxc-attach -n cloud-lxc -- scp /home/$name/$restfile root@10.0.3.1:/root/MyCloud/$name/ > /dev/null 2>&1
	tar -xf /root/MyCloud/$name/$restfile -C /root/MyCloud/$name/ --strip-components=3
	rm /root/MyCloud/$name/$restfile


	echo "....Revert Successful!"
	printf "\n $(date): $name Reverted to $restfile. <br>" | ssh root@10.0.3.34 "cat >> /var/www/html/userLogs.html"
fi
