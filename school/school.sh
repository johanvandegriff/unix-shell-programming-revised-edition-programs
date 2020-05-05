#!/bin/bash
cd `dirname $0`
list(){
  cat subjects | awk 'BEGIN{x=0}{x++; print x, $0}'
}
get(){
  cat subjects | head -$1 | tail -1
}
while true
do
  clear
  day=`date '+%a %D'`
  echo "$day

1.Add a subject
2.List the subjects
3.Record hours on a subject
4.Exit"
  read choice
  case "$choice" in
    1)echo -n "subject name: "
      read subject
      if [ -n "$subject" ]
      then
        echo "$subject" | tr -d '^' >> subjects
      fi;;
    2)echo
      list
      read choice;;
    3)echo "Which subject?"
      list
      read subject
      echo -n "How many hours: "
      read hoursread
      echo -n "How many 1/4 hours: "
      read minutesread
      hours=`expr "$minutesread" "/" "4"`
      hours=`expr "$hours" "+" "$hoursread"`
      minutes=`expr "$minutesread" "%" "4"`
      if [ "$minutes" -eq 2 ]
      then
        minutesstring="1/2"
      else
        minutesstring="$minutes/4"
      fi
      message=`get $subject`
      message="$day: $hours $minutesstring hours spent on $message"
      echo "$message"
      echo "$message" >> hours.txt
      read choice;;
    4)exit;;
  esac
done
