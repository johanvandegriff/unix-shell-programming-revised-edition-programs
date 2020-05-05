#!/bin/bash
page=`wget -O - https://scratch.mit.edu/users/jjvan/projects/ 2>/dev/null`
echo "$page" | grep '<a href="/projects/' | grep '</a>' | head -5
