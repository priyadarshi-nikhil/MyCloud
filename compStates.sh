#!/bin/bash
echo

echo "The selected backup has following changes from current state"
#echo $file
echo

lxc-attach -n cloud-lxc -- scp /home/$name/$file root@10.0.3.1:/root/MyCloud/$name/ > /dev/null 2>&1
#lxc-attach -n cloud-lxc -- tar  /home/$name/$file #-C /var/lib/lxc/cloud-lxc/rootfs/home/$name/
mkdir -p /root/MyCloud/$name/tmp/

tar -xf /root/MyCloud/$name/$file -C /root/MyCloud/$name/tmp/ --strip-components=3
rm /root/MyCloud/$name/$file
echo "Files only on MyCloud:"
diff /root/MyCloud/$name /root/MyCloud/$name/tmp/ | grep "/root/MyCloud/$name/tmp/" |awk '{print $4}'
echo "Files only on Local:"
diff /root/MyCloud/$name /root/MyCloud/$name/tmp/ |grep -w "/root/MyCloud/$name" |awk '{print $4}'
#ls -al /root/MyCloud/$name |grep '^-' | awk '{print $9}'

rm -r /root/MyCloud/$name/tmp


#awk '/root/MyCloud/$name/ && !/root/MyCloud/$name/$name/'