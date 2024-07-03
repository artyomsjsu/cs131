#!/bin/bash

backup_dest="./backups"
mkdir -p "$backup_dest"

timestamp=$(date +%Y%m%d_%H%M%S)

prompt_for_input() {
 read -p "Enter directory or file path to backup (leave blank to end): " input
 echo "$input"
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
			echo "Error: $input is not a valid directory or file."
		fi
	done
fi

echo "Inputs: ${inputs[@]}"

for arg in "${inputs[@]}"; do
	base_name=$(basename "$arg")
	backup_file="backup_${base_name}_${timestamp}.tar.gz"

	echo "Processing $arg"

	echo "Creating backup file for $arg"
	tar -czf "$backup_dest/$backup_file" "$arg"

	if [ $? -eq 0 ]; then
		echo "Backup successful: $backup_file created in $backup_dest"
	else
		echo "Backup failed for $arg."
	fi
done
