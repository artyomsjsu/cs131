This simple command is a background timer for bash shells. It runs in the background allowing users to do other work while the timer is running.

Use:
The script accepts command line arguments or user input. The first input is duration in seconds, the second input is repetitions. Grant the script execution privileges by using "chmod -x ./timer.sh", then use "./timer.sh" by itself or with the two command line arguments following it.

This script has a multitude of uses that are up to the user. It can be used as a one time reminder, a repetition counter, anything that a standard timer could be used for.

Examples:
[artyomsu24@sjsu a2]$ ./timer.sh 10 3
Timer started in the background.
[artyomsu24@sjsu a2]$ Starting timer for 10 seconds (Repetition 1 of 3)
ls
README.md  timer.sh
[artyomsu24@sjsu a2]$ lsTime's up for repetition 1.
Starting timer for 10 seconds (Repetition 2 of 3)
 ..
a1  a2  README.md
[artyomsu24@sjsu a2]$ ls ../..Time's up for repetition 2.
Starting timer for 10 seconds (Repetition 3 of 3)

bin  cs131  exercise
[artyomsu24@sjsu a2]$ Time's up for repetition 3.


Issues:
The command does not seem to show up as a background process when using the "jobs" command. This means it cannot be killed? Unsure why.

The echo statements interrupt typing visually. If a timer completes, the echo statement informing the user will break their typing visually, though if you keep typing your command and hit enter the command you typed will go through. (note the first ls usage in the example)

The echo statements also newline instead of returning the user to the standard username@hostname bash prompt. Unsure of how to fix this. (note the lack of prompt at the end)
