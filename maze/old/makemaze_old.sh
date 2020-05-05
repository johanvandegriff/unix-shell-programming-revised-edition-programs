#!/bin/sh
cd
mkdir maze
cd maze
mkdir 1 2 3 4 5
cd 2
mkdir 1 2
cd 2
mkdir 1 2 3
cd 3
mkdir 1 2
cd ~/maze/4
mkdir 1 2 3 4
cd 3
mkdir 1 2 3 4
cd 4
mkdir 1 2 3 4
cd 3
mkdir 1 2 3
cd ../2
mkdir 1 2 3 4
cd 3
mkdir 1 2 3
cd 1
mkdir 1 2
cd ../../1
mkdir 1 2 3 4 5
cd 5
echo 'congradulations!!!!
You have reached the end.' > end
cd ~/maze/3
mkdir 1 2 3
cd 3
mkdir 1 2
cd 1
mkdir 1 2 3
cd