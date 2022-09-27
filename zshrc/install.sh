#!/bin/bash
echo "Setting up ZSH"

cd "$(dirname "$0")"
cp zshrc ~/.my.zsh
# todo add [ -f ~/.my.zsh ] && source ~/.my.zsh to .zshrc

echo "Done"
