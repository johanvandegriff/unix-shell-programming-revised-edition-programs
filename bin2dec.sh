#!/bin/sh
echo "Type in a binary number."
read binary
binary=`echo "$binary" | rev`
decimal=0
i=0
add=1
while [ "$i" -lt `echo "$binary" | wc -l` ]
do
  i=`expr "$i" + 1`
  test echo "$binary" | cut "-c$i-$i" && decimal=`expr "$decimal" + "$add"`
  add=`expr "$add" "*" 2`
done
echo "$decimal"
