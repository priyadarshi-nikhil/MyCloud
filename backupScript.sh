#!/bin/bash
mkdir -p ~/MyCloud/"$name"
#Source Dir
src="/root/MyCloud/"$name""

#Destination
dest="/home/"$name""


#Create Archive Filename
day=$(date +%Y-%m-%d-%H-%M-%S)
DAY=$(date +%A)
archive_file="$day.tar.gz"
export $DAY

#Backup the files using tar
tar czf /root/MyCloud/$name/$archive_file --exclude='*.tar.gz' /root/MyCloud/$name 


number=$(lxc-attach -n cloud-lxc -- ls /home/$name |grep .tar.gz | wc -l)
if [ $number -eq 10 ];then
	rm $(find /var/lib/lxc/cloud-lxc/rootfs/home/$name -type f|grep .tar.gz | sort | head -n 1)
fi


rsync -az /root/MyCloud/$name/ root@10.0.3.231:/home/$name/
rm -r /root/MyCloud/$name/*.tar.gz


