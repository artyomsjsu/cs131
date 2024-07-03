#!/bin/bash

backup_dest="./backups"
mkdir -p "$backup_dest"

timestamp=$(date +%Y%m%d_%H%M%S)

log_file="$backup_dest/backup_log_$timestamp.log"

prompt_for_input() {
 read -p "Enter directory or file path to backup (leave blank to end): " input
 echo "$input"
}

log_message() {
 echo "$1" | tee -a "$log_file"
}

if [ $# -gt 0 ]; then
	inputs=("$@")
else
	inputs=()
	while true; do
		input=$(prompt_for_input)
		if [ -z "$input" ]; then
			break
		fi
		if [ -e "$input" ]; then
			inputs+=("$input")
		else
			log_message "Error: $input is not a valid directory or file."
		fi
	done
fi

log_message "Backup started at $(date)"
log_message "Inputs: ${inputs[@]}"

for arg in "${inputs[@]}"; do
	base_name=$(basename "$arg")
	backup_file="backup_${base_name}_${timestamp}.tar.gz"

	if [ -e "$arg" ]; then

		log_message "Creating backup file for $arg"
		tar -czf "$backup_dest/$backup_file" "$arg"

		if [ $? -eq 0 ]; then
			log_message "Backup successful: $backup_file created in $backup_dest"
		else
			log_message "Backup failed for $arg."
		fi
	else
		log_message "Error: $arg does not exist"
	fi
done

log_message "Backup process completed at $(date)"
