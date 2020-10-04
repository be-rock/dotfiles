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


source $PWD/.exports
source $PWD/.functions

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
        tree \
        vim \
        wget \
        xclip \
        zsh

}

function debian_gnome_setup () {
    print_msg "debian_gnome_setup..."
    sudo apt update -y

    sudo apt install \
        deja-dup \
        gnome-tweaks \
        shotwell \
        snapd \
        sqlitebrowser 

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
    #sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    #git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
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
    #ln -s $HOME/miniconda/bin/conda $HOME/.local/bin/conda
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

        ohmyzsh_setup
        starship_setup
        python_setup
    fi
}

runner

# end
