#!/bin/bash

# Configuration
LOG_DIR="/path/to/logs"  # Change this to your actual log directory
BACKUP_DIR="/path/to/backup"  # Change this to your actual backup directory
MAX_BACKUPS=5  # Maximum number of backups to keep

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create a timestamp
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")

# Archive logs
tar -czf "$BACKUP_DIR/logs_$TIMESTAMP.tar.gz" -C "$LOG_DIR" .

# Remove old backups if exceeding MAX_BACKUPS
BACKUP_COUNT=$(ls -1 "$BACKUP_DIR" | wc -l)
if [ "$BACKUP_COUNT" -gt "$MAX_BACKUPS" ]; then
    ls -1tr "$BACKUP_DIR" | head -n -$MAX_BACKUPS | xargs -d '\n' rm -f --
fi

# Clear log directory after backup
rm -f "$LOG_DIR"/*

# Display confirmation message
echo "Backup and log rotation completed successfully."

# Show contents of backup directory
ls -lh "$BACKUP_DIR"
