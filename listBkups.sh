#!/bin/bash

echo "Following backups are available:"

lxc-attach -n cloud-lxc -- ls -al /home/$name/ | awk '{print $6,$7,$8,$9,$5}'| grep tar.gz
