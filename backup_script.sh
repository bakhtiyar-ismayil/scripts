#!/bin/bash


# Set backup directory path
BACKUP_DIR="/backup"

# Set the files and directories to be backed up
FILES_TO_BACKUP=(
    "/etc"
    "/home"
    "/var/www"
)

# Set the backup filename with the current date and time
BACKUP_FILENAME="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Create backup archive
tar -czf $BACKUP_DIR/$BACKUP_FILENAME ${FILES_TO_BACKUP[@]}

# Display backup completed message
echo "Backup completed: $BACKUP_DIR/$BACKUP_FILENAME"

# Ask user if they want to restore from backup
read -p "Do you want to restore from backup? (y/n) " choice
case "$choice" in
  y|Y )
    # Ask user for the backup filename to restore from
    read -p "Enter the backup filename: " backup_filename

    # Check if the backup file exists
    if [ -f "$BACKUP_DIR/$backup_filename" ]; then
        # Extract the backup archive to the root directory
        sudo tar -xzf $BACKUP_DIR/$backup_filename -C /

        # Display restore completed message
        echo "Restore completed."
    else
        # Display error message if backup file does not exist
        echo "Error: Backup file not found."
    fi
    ;;
  n|N )
    # Display exit message if user chooses not to restore from backup
    echo "Exiting script."
    ;;
  * )
    # Display error message if user enters invalid choice
    echo "Invalid choice. Exiting script."
    ;;
esac

