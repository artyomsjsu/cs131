Use:<br>
This utility uses Linux's tar command to create compressed backups of files or entire directories into a "/backups" directory and logs the process.

This command is useful when the user needs a backup of a file or multiple files or a directory for any reason. This could be a file that they plan to modify or an important directory that they don't want to lose.

A use case in the CS 131 Processing Big Data course would be transferring large data files that are now compressed, or backing up large data files that are going to be modified in the future for analysis.

Example:<br>
[artyomsu24@sjsu a2]$ ./backuputil.sh ./README.md<br>
Backup started at Wed Jul 3 02:14:15 EDT 2024<br>
Inputs: ./README.md<br>
Creating backup file for ./README.md<br>
Backup successful: backup_README.md_20240703_021415.tar.gz created in ./backups<br>
Backup process completed at Wed Jul 3 02:14:15 EDT 2024<br>
[artyomsu24@sjsu a2]$ ls<br>
backups backuputil.sh README.md<br>
[artyomsu24@sjsu a2]$ cd backups/<br>
[artyomsu24@sjsu backups]$ ls<br>
backup_log_20240703_021415.log backup_README.md_20240703_021415.tar.gz<br>
[artyomsu24@sjsu backups]$ cat backup_log_20240703_021415.log<br>
Backup started at Wed Jul 3 02:14:15 EDT 2024<br>
Inputs: ./README.md<br>
Creating backup file for ./README.md<br>
Backup successful: backup_README.md_20240703_021415.tar.gz created in ./backups<br>
Backup process completed at Wed Jul 3 02:14:15 EDT 2024<br>
[artyomsu24@sjsu backups]$ cd ..<br>
[artyomsu24@sjsu a2]$ ls<br>
backups backuputil.sh README.md<br>
