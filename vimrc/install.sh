#!/bin/bash
echo "Setting up vim!"

cd "$(dirname "$0")"

#install Vundle if not exists
if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
    echo "Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cp vimrc ~/.vimrc
#neovim config
cp init.vim ~/.config/nvim

echo "Done"
