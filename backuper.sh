#!/bin/bash

echo 'Backuper is running...'

# tar -czvf /d/backups/archive.tar.gz -C ~/AppData/Roaming/librewolf/profiles/*.default-default/ ./

# $() syntax allows to have result of the command (pgrep)
procid=$( pgrep -x librewolf )
# $? stores execution code of the previous command (pgrep);
# $? can be 0 (execution success) and non-zero (error code)
if [ $? = 0 ]; then kill $procid; fi

srcPath=/home/rd/.librewolf
destPath=/mnt/C050F4F250F4F050/backups

# -e flag is specific to conditional expression [],
# check if file or directory exists;
# -d check if a directory;
# good practice to quote variables inside [],
# coz empty string or variable with the string that includes spaces,
# can be reason of an error
if [ ! -e "$srcPath"  ] || [ ! -d "$srcPath" ]; then echo 'error 1: wrong source'; exit 1; fi

tar -czvf $destPath/librewolf-backup-test.tar.gz -C $srcPath $(basename $srcPath/*.default-default)

# -e flag enables backslashes interpretation (escape sequences)
echo -e "Source to archive: $srcPath"
echo -e "Destination: $destPath"
echo 'Backuper done'

exit 0