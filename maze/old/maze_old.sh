#!/bin/sh
if [ ! -d $HOME/programs/maze/maze ]
then
    $HOME/programs/maze/makemaze
fi
cd $HOME/programs/maze/maze
while true
do
    if [ -d end ]
    then
        echo "You found the end!"
        echo "Press ENTER to exit."
        read a
        exit 0
    fi
    ls -1
echo 'B (Back)'
echo 'Q (Quit)'
echo '
 _    _     _    _____   ___
| \  / |   /_\  |__  /  | __|
||\\//||  //_\\   / /_  | __|
|| \/ || //   \\ /____| |___|
'
echo -n 'Please choose one of the above '
read choice
#    case "$choice" in
#       [0-9]) cd "$choice" ;;
#        [Bb]) if [ ! `pwd` = "$HOME/maze" ]
#              then
#                cd ..
#              fi ;;
#        [Qq]) exit 0 ;;
#     [Ll]ost) pwd;;
#    esac
done
