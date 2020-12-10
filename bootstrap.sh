#!/usr/bin/env bash

function initial_setup() {
    source $PWD/.exports
    source $PWD/.functions

    print_msg "creating directories"
    mkdir -p $HOME/{.cache,.config,.local/{bin,lib,share}}

    print_msg "create symlinks if files dont already exist..."
    for file in .{aliases,exports,functions,inputrc,misc,sqliterc,starship.toml,vimrc}; do
        if [[ ! -r "$HOME/$file" ]] ; then
            print_msg "Executing: ln -s $PWD/$file $HOME/$file ..."
            print_msg "Executing: ln -s $PWD/$file $HOME/.config/$file ..."
            ln -s $PWD/$file $HOME/.config/$file
            print_msg "Return code: $?"
            ln -s $PWD/$file $HOME/$file
            print_msg "Return code: $?"
        fi
    done


    unset file
}

function debian_base_setup () {
    print_msg "debian_base_setup..."
    sudo apt update

    sudo apt install -y \
        bat \
        curl \
        exfat-fuse \
        exfat-utils \
        jq \
        git \
        neofetch \
        tldr \
        tree \
        vim \
        wget \
        xclip \
        zsh

    ln -s /usr/bin/batcat ~/.local/bin/bat

}

function debian_gnome_setup () {
    print_msg "debian_gnome_setup..."
    sudo apt update

    sudo apt install -y \
        deja-dup \
        gnome-tweaks \
        shotwell \
        snapd 

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
    print_msg "mac_setup..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    brew install \
        bat \
        jq \
        pipx \
        starship \
        tree \
        zsh

    brew cask install \
        docker \
        maccy \
        rectangle
}

function ohmyzsh_setup() {
    print_msg "ohmyzsh_setup..."
    sudo chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    chsh -s $(which zsh)
}

function starship_setup() {
    print_msg "starship_setup..."
    curl -fsSL https://starship.rs/install.sh | bash
}

function python_setup() {
    print_msg "python setup..."
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
    bash ~/miniconda.sh -b -p $HOME/miniconda
    $HOME/miniconda/bin/conda init zsh
    exec /usr/bin/zsh -l
    $HOME/miniconda/bin/conda activate base
}

function pipx_setup() {
    pipx install \
        awscli \
        black \
        bpytop \
        tldr
}


function runner() {
    if [ "$INITIAL_INSTALL" = "YES" ]; then
        mkdir -p $HOME/.local/bin
        export PATH=$HOME/.local/bin:$PATH

        if [ SYSTEM_TYPE="Linux (Debian)" ]; then
            debian_base_setup
            #debian_gnome_setup
        elif [ SYSTEM_TYPE="macOS" ]; then
            mac_setup
        fi
    fi

    #ohmyzsh_setup
    #starship_setup
    python_setup
}

#initial_setup

runner

# end
