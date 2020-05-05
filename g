#!/bin/sh
opts=""
while getopts abc opt
do
  if [ "$opt" != '?' ]
  then
    opts="$opts $opt"
  fi
done
for opt in $opts
do
  echo "$opt"
done | sort
