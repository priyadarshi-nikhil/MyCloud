#!/bin/bash

s=$(mysql -u host -h 10.0.3.51 -p123456 -e "SELECT storage from mycloud.info where username='$name';")
s=$(echo $s|sed 's/[^ ]* *//')
t=$(mysql -u host -h 10.0.3.51 -p123456 -e "SELECT subscription from mycloud.info where username='$name';")
t=$(echo $t|sed 's/[^ ]* *//')

echo
echo "Hi $name!"

echo "You have a $t subscription."
lxc-attach -n cloud-lxc -- chage --list $name | grep Account| awk '{print $1,$2,$3,$4,$5,$6}'
echo "Storage limit :$s GB"
echo


disk=$(lxc-attach -n cloud-lxc -- du -h /home/$name)
set -- $disk
echo " Your current disk usage is: $1"


bites=$(lxc-attach -n cloud-lxc -- du -b /home/$name)
set -- $bites
leftBite=$((s*1073741824))
a=$((leftBite-$1))
b=`echo "scale=4;$a/1073741824" | bc -l`
echo "You have $b GB space left." 


x=$(lxc-attach -n cloud-lxc -- chage --list $name | grep Account| awk '{print $4,$5,$6}')
 
daysLeft=$((($(date +%s --date "$x")-$(date +%s))/(3600*24)))

echo " $daysLeft days left for your account to expire."
./landing.sh
