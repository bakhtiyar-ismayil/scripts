#!/bin/bash
cd /root/backup

#echo $(ls -t | grep "^[0-9]\{8\}_[0-9]\{4\}\.tar\.gz$" | head -n 2)

# show all backup files and list them
dont_delete=$(ls -t | grep "^[0-9]\{8\}_[0-9]\{4\}\.tar\.gz$" | head -n 2)

# List all backup files
all_files=$(ls | grep "^[0-9]\{8\}_[0-9]\{4\}\.tar\.gz$")

# Delete backup files amd keet just last two
for file in $all_files; do
    if [[ ! "$dont_delete" =~ "$file" ]]; then
        rm "$file"
        echo "Deleted $file"
    fi
done
