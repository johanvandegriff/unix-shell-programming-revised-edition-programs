#!/bin/bash
from="$1"
to="$2"
all=`ls "$to"`
if [ "$3" == "-r" ]
then
  name=`echo "$all" | tail -1`
  echo "$name"
  sudo cp "$to/$name" "$from"
else
  if [ -z "$all" ]
  then
    name="0000000000"
  else
    name=`echo "$all" | tail -1 | awk '{print $0 + 1}'`
    name=`printf "%10s" "$name" | tr ' ' '0'`
  fi
  cp "$from" "$to/$name"
fi
