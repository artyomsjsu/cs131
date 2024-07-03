#!/bin/bash

get_input() {
 local input="$1"
 local prompt="$2"
 local default="$3"

 if [ -z "$input" ]; then
  read -p "$prompt" input
  input="${input:-$default}"
 fi

 echo "$input"
}

duration=$(get_input "$1" "Enter the timer duration in seconds: " "10")

repetitions=$(get_input "$2" "Enter the number of repetitions: " "1" )

run_timer() {
 for ((i=1; i<=repetitions; i++))
 do
  echo "Starting timer for $duration seconds (Repetition $i of $repetitions)"
  sleep "$duration"
  echo "Time's up for repetition $i."
 done
}

export -f run_timer
export duration 
export repetitions

bash -c run_timer &

echo "Timer started in the background."
