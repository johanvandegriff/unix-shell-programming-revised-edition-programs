#!/bin/bash

file="$HOME/downloads/hat.txt"
minItems=15
maxItems=100


test -f "$file" || > "$file"
test -f "$file" || exit 1

while true
do
  clear
  contents=`cat "$file" | sort -u`
  echo "$contents" > "$file"
  length=`wc -l < "$file"`
  if [[ "$length" -gt "$minItems" ]]
  then
    echo -n "Do you want to pull an item out of the hat? (Y/n)"
    read -n 1 answer
    echo
    if [[ "$answer" != "n" ]]
    then
      rand=$((${RANDOM} % $length + 1))
      item=`head -$rand "$file" | tail -1`
      echo "$item"
      contents=""
      test $rand -gt 1 && contents=`head -$(($rand-1)) "$file"`""
      test $rand -ne $length && test $rand -ne 1 && contents="$contents
"
      contents="$contents"`tail -$(($length-$rand)) "$file"`
      echo "$contents" > "$file"
    fi
  fi
  echo "Put an item in the hat:"
  read line
  test -z "$line" && line="$item"
  echo "$line" >> "$file"
done
