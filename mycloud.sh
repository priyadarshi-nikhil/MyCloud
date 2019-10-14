#!/bin/bash

mkdir -p ~/MyCloud/"$name"
echo "Your MyCloud Sync Directory is at $(cd ~/MyCloud/"$name" && pwd)"
echo "Your Files....."
ls ~/MyCloud/"$name"


echo "press 1 to take backup now!"
read b
if [ "$b" -eq 1 ];then
	./backupScript.sh
else
	echo "...exiting.."
fi



#./landing.sh

