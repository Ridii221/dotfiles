#!/bin/bash
echo "Setting up vim!"

cd "$(dirname "$0")"

#install Vundle if not exists
#if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
#    echo "Installing Vundle"
#    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#fi

#install Plug if not exists
if [ ! -f ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim ]; then
    echo "Installing Plug"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

cp vimrc ~/.vimrc
#neovim config
cp init.vim ~/.config/nvim

echo "Done"
