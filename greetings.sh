#!/bin/sh

#
# Program to print a greeting
#

echo

hour=`date +%H`


case $hour in
  0? | 1[01] )   echo "Good morning";;
      1[2-7] )   echo "Good afternoon";;
           * )   echo "Good evening";;
esac

echo
