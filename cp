#!/bin/sh

numargs=$#
filelist=
copylist=

while [ "$#" -gt 1 ]
do
  filelist="$filelist $1"
  shift
done

to="$1"

if [ "$numargs" -gt 2 ]
then
  name=`basename $0`
  echo "Usage: $name file1 file2"
  echo "       $name file(s) dir"
  exit 1
fi
for from in filelist
do
  if [ -d "$to" ]
  then
    tofile="$to/`basname $from`"
  else
    tofile="$to"
  fi
  if [ -f "$tofile" ]
  then
    echo -n "$tofile already exists; overwrite it(yes/no)?"
    read answer
  else
    answer="yes"
  fi
  if [ "$answer" = "yes" ]
  then
    copylist="$copylist $from"
  fi
  if [ -n "$copylist" ]
  then
    cp "$copylist" "$to"
  fi
done
