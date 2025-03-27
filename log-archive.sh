#!/bin/bash

log_directory="/var/log"

logfile="$log_directory/logfile.txt"
journalctl -b > "$logfile"

timestamp=$(date +"%Y%m%d_%H%M%S")

archive_directory="$log_directory/logs_archives_$timestamp"
mkdir -p "$archive_directory"

tar -czf "$archive_directory/logs_archive_$timestamp.tar.gz" "$logfile"

rm "$logfile"

echo "Log archive created successfully in $archive_directory."
