#!/bin/bash
echo "Setting up neovim!"

cd "$(dirname "$0")"

cp -u -r . ~/.config/nvim
rm ~/.config/nvim/install.sh

echo "Done"
