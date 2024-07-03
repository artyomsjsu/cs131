This utility uses Linux's tar command to create compressed backups of files or entire directories into a "/backups" directory and logs the process.

This command is useful when the user needs a backup of a file or multiple files or a directory for any reason. This could be a file that they plan to modify or an important directory that they don't want to lose.

A use case in the CS 131 Processing Big Data course would be transferring large data files that are now compressed, or backing up large data files that are going to be modified in the future for analysis.

Example:
[artyomsu24@sjsu a2]$ ./backuputil.sh ./README.md
Backup started at Wed Jul 3 02:14:15 EDT 2024
Inputs: ./README.md
Creating backup file for ./README.md
Backup successful: backup_README.md_20240703_021415.tar.gz created in ./backups
Backup process completed at Wed Jul 3 02:14:15 EDT 2024
[artyomsu24@sjsu a2]$ ls
backups backuputil.sh README.md
[artyomsu24@sjsu a2]$ cd backups/
[artyomsu24@sjsu backups]$ ls
backup_log_20240703_021415.log backup_README.md_20240703_021415.tar.gz
[artyomsu24@sjsu backups]$ cat backup_log_20240703_021415.log
Backup started at Wed Jul 3 02:14:15 EDT 2024
Inputs: ./README.md
Creating backup file for ./README.md
Backup successful: backup_README.md_20240703_021415.tar.gz created in ./backups
Backup process completed at Wed Jul 3 02:14:15 EDT 2024
[artyomsu24@sjsu backups]$ cd ..
[artyomsu24@sjsu a2]$ ls
backups backuputil.sh README.md
