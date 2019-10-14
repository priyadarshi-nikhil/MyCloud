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
./landing.sh
