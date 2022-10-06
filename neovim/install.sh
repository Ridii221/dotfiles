#!/bin/bash
echo "Setting up neovim!"

cd "$(dirname "$0")"

# install packer
if [ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

cp -u -r . ~/.config/nvim
rm ~/.config/nvim/install.sh
rm ~/.config/nvim/README.md

echo "Done"
