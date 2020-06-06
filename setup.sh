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


source $HOME/git/dotfiles/.exports
source $HOME/git/dotfiles/.functions

function debian_setup () {
    sudo apt update

    sudo apt install \
        bat \
        curl \
        deja-dup \
        exfat-fuse \
        exfat-utils \
        jq \
        git \
        gnome-tweaks \
        neofetch \
        shotwell \
        snapd \
        sqlitebrowser \
        tree \
        vim \
        wget \
        xclip \
        zsh

    sudo snap install \
        hello-world \
        code --classic \
        docker \
        libreoffice \
        pycharm-community --classic \
        intellij-idea-community --classic \
        vlc
}

function mac_setup() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    brew install \
        bat \
        jq \
        tree \
        zsh

    brew cask install \
        docker \
        maccy \
        rectangle
}

function ohmyzsh_setup() {
    sudo chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function python_setup() {
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
    bash ~/miniconda.sh -b -p $HOME/miniconda
    ln -s $HOME/miniconda/bin/conda $HOME/.local/bin/conda
    $HOME/miniconda/bin/conda init zsh
    exec /usr/bin/zsh -l
    $HOME/miniconda/bin/conda activate base
    
    python -m venv $HOME/.venv/misc
    $HOME/.venv/misc/bin/pip install \
        airflow
}


function runner() {
    if [ "$INITIAL_INSTALL" = "YES" ]; then 
        mkdir -p $HOME/.local/bin $HOME/.venv/misc
        export PATH=$HOME/.local/bin:$PATH

        if [ SYSTEM_TYPE="Linux (Debian)" ]; then 
            echo 'debian setup...'
            debian_setup
        elif [ SYSTEM_TYPE="macOS" ]; then 
            echo 'mac setup...'
            mac_setup
        fi

        ohmyzsh_setup
        python_setup
    fi
}

runner


cat << EOF

Other installation considerations:
  https://sqlitebrowser.org/
  https://dbeaver.io
  https://www.postman.com/downloads/

EOF

# end
