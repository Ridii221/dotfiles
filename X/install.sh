#!/bin/bash
echo "Setting up X11!"

cd "$(dirname "$0")"
# set keymap
cp Xmodmap ~/.Xmodmap
# for i3
cp xmodmap.sh ~/.xmodmap.sh
# set xprofile
cp xprofile ~/.xprofile

echo "Done"
