#!/usr/bin/env bash

# setup local bin
mkdir -p $HOME/.bin

# create symlinks
ln -s $HOME/git/dotfiles/.aliases $HOME/.aliases
ln -s $HOME/git/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/git/dotfiles/.bash_profile $HOME/.bash_profile
ln -s $HOME/git/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/git/dotfiles/.zshrc $HOME/.zshrc

if [ $(uname -s) = 'Darwin' ]; then
    echo $hostname
    brew install bat
    brew install tree
elif [ $(uname -s) = 'Linux' ] && [ -a /etc/debian_version ]; then
    echo $hostname
    apt install bat
    sudo apt-get install tree
elif [ $(uname -s) = 'Linux' ] && [ -a /etc/redhat-release ]; then
    echo $hostname
fi

#end
