#!/bin/bash
echo "Setting up Kitty!"

cd "$(dirname "$0")"

cp kitty.conf ~/.config/kitty/
cp diff.conf ~/.config/kitty/

echo "Done"
