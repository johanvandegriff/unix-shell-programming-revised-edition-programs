#!/bin/sh

root=`dirname $0`

if [ ! -d $root/maze ]
then
    $root/makemaze.pl
fi
 
cd $root/maze

while true
do

  if [ -d E ]
  then
    echo
    cat $root/logo.txt
    echo
    echo "You found the end!"
    echo "Press ENTER to exit."
    read a
    exit 0
  fi

  echo

  ls -1

  echo
  echo "B (Back)"
  echo "Q (Quit)"
  echo "Location:"
  pwd | tr '/' 'X' | sed s/`echo $root | tr '/' 'X'`//g | tr 'X' '/'

  cat $root/logo.txt

  echo -n 'Please choose one of the above '

  read choice

  case "$choice" in

   [0-9]) cd "$choice" ;;

    [Bb]) if [ ! `pwd` = "$root/maze" ]
          then
            cd ..
          else
            echo "Cannot go back, you are at the top of the maze."
          fi ;;

    [Qq]) exit 0 ;;

  esac
done
