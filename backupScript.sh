#Source Dir
backup_files="/root/MyCloud/"$name""

#Destination
dest="/root/MyCloud/"$name""

#Create Archive Filename
day=$(date +%Y-%m-%d)
hostname=$(hostname -s)
archive_file="$hostname-$day.tar.gz"

#Print start status message
echo "Backing up $backup_files to $dest/$archive_file"
date 
echo

#Backup the files using tar
tar czf $dest/$archive_file $backup_files

scp /root/MyCloud/"$name"/*gz root@10.0.3.231:/home/"$name"
rm /root/MyCloud/"$name"/*gz

#Print end status message
echo
echo "Backup finished."
date



#Long listing of files in $dest to check file sizes
ls -l $dest

