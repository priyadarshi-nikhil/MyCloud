#!/bin/bash

echo "Select backup state to restore to"

lxc-attach -n cloud-lxc -- ls -al /home/$name/ | awk '{print $6,$7,$8,$9}'| grep tar.gz | awk '{print NR, $0}'

read rest
 
echo "selected backup is"
lxc-attach -n cloud-lxc -- ls -al /home/$name/ | awk '{print $9}'| grep tar.gz | awk '{print NR, $0}' | grep -P "^\Q$rest\E"

echo
echo

export restfile=$(lxc-attach -n cloud-lxc -- ls -al /home/$name/ | awk '{print $9}'| grep tar.gz | awk '{print NR, $0}' | grep -P "^\Q$rest\E"|awk '{print $2}')


./restoreLogic.sh