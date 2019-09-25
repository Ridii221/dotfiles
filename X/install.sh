#!/bin/bash
echo "Setting up X11!"

cd "$(dirname "$0")"
# set keymap
cp Xmodmap ~/.Xmodmap
# set xprofile
cp xprofile ~/.xprofile

echo "Done"
