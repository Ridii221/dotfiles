#!/bin/bash
echo "Setting up vim!"

cd "$(dirname "$0")"
cp vimrc ~/.vimrc
cp init.vim ~/.config/nvim

echo "Done"
