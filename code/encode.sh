#!/bin/bash
file="$1"
letters="$2"
codeletters="$3"
outfile="$4"

if [ "$#" -eq "0" ]
then
  echo "usage: $0 (input file) (letters to change) (letters to change to) [output file]"
  exit 1
fi

if [ ! -f "$file" ]
then
  echo "$file does not exist or is not a normal file."
  exit 1
fi

message=`cat "$file" | tr "$letters" "$codeletters"`

if [ "$outfile" == "" ]
then
  echo "$message"
else
  echo "$message" > "$outfile"
fi
