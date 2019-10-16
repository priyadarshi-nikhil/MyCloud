#!/bin/bash
#Source Dir
backup_files="/root/MyCloud/"$name"/"

#Destination
dest="/root/home/"$name""

#Create Archive Filename
#day=$(date +%Y-%m-%d-%R)
#archive_file="$day.tar.gz"

#Print start status message
echo "Backing up $backup_files to $dest/$archive_file"
date 
echo

#Backup the files using tar
#tar czf $dest/$archive_file $backup_files

rsync -avzh $backup_files root@10.0.3.231:/home/"$name"
#scp /root/MyCloud/"$name"/*gz root@10.0.3.231:/home/"$name"
#rm /root/MyCloud/"$name"/*gz

#Print end status message
echo
echo "Backup finished."
date



#Long listing of files in $dest to check file sizes
#ls -l $dest

# rsync options source destination
# scp options src dest



