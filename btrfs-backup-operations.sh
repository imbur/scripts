#This is not really a script, rather just a collection of commands that are useful when creating backups of the BTRFS file system

# Create a read-only snapshot
sudo btrfs subvolume snapshot -r $LOCATION_OF_RW_SNAPSHOT $LOCATION_OF_READONLY_SNAPSHOT

# Send a backup to a different medium
sudo btrfs send @-20190626/ | pv | sudo btrfs receive /media/backup/

# Send only the delta backup to a different medium
# The -p will specify a base snapshot
# The receiver needs to have the base snapshot 
sudo btrfs send -p @-BASE/ @-NEW/ | pv | sudo btrfs receive /media/backup/
