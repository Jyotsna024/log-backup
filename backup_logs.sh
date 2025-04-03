log_file="log_file.log"
bkup_dir="backup"
timestamp=$(date +"%Y%m%d_%H%M%S")
mkdir -p "$bkup_dir"
echo "Good Morning" >> "$log_file"
echo "Good Evening" >> "$log_file"
if [ -f "$log_file" ]; then 
  mv "$log_file" "$bkup_dir/Bkup_log_file_$timestamp.log"
  echo "Backup successful: $bkup_dir/Bkup_log_file_$timestamp.log"
else
  echo "No log file found to back up."
fi
touch "$log_file"
echo "New log file created: $log_file"
ls -ltr "$bkup_dir"
cat "$log_file"
