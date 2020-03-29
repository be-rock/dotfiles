#!/usr/bin/env bash

# create symlinks if files dont already exist
for file in .{aliases,exports,functions,inputrc,misc,sqliterc,vimrc}; do
    if [[ ! -r "$HOME/$file" ]] ; then
        echo "Executing: ln -s $HOME/git/dotfiles/$file $HOME/$file ..."
        ln -s $HOME/git/dotfiles/$file $HOME/$file
        echo "Return code: $?"
    fi
done
unset file

if [ $(uname -s) = 'Darwin' ]; then
    export LSCOLORS="Gxfxcxdxbxegedabagacad"
    export SYSTEM_TYPE="macOS"
elif [ $(uname -s) = 'Linux' ] && [ -f /etc/debian_version ]; then
    export SYSTEM_TYPE="Linux (Debian)"
elif [ $(uname -s) = 'Linux' ] && [ -f /etc/redhat-release ]; then
    export SYSTEM_TYPE="Linux (RedHat)"
fi

if [ SYSTEM_TYPE="Linux (Debian)" ] && [ INITIAL_INSTALL="YES" ]; then
    sudo apt update
    sudo apt install gnome-tweaks
    sudo apt install wget curl git zsh vim bat tree neofetch
    sudo apt install deja-dup snapd shotwell
    sudo apt install exfat-fuse exfat-utils
    sudo snap install hello-world
    sudo snap install code --classic
    sudo snap install docker
    sudo snap install libreoffice
    sudo snap install pycharm-community --classic
    sudo snap install vlc
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

mkdir -p $HOME/.local/bin

cat << EOF

Other installation considerations:
  https://sqlitebrowser.org/
  https://dbeaver.io
  https://www.postman.com/downloads/
  https://www.docker.com/products/docker-desktop

EOF

# end
