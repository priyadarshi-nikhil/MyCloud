#!/bin/bash

echo "Select a backup state to compare from"

lxc-attach -n cloud-lxc -- ls -al /home/$name/ | awk '{print $6,$7,$8,$9}'| grep tar.gz | awk '{print NR, $0}'

read comp
 
echo "selected backup is"
lxc-attach -n cloud-lxc -- ls -al /home/$name/ | awk '{print $9}'| grep tar.gz | awk '{print NR, $0}' | grep -P "^\Q$comp\E"

echo
echo

export file=$(lxc-attach -n cloud-lxc -- ls -al /home/$name/ | awk '{print $9}'| grep tar.gz | awk '{print NR, $0}' | grep -P "^\Q$comp\E"|awk '{print $2}')

#export $file
#echo $file
./compStates.sh