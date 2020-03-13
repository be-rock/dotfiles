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

mkdir -p $HOME/.local/bin

cat << EOF

Other installation considerations:
  tree: sudo apt install tree | brew install tree | yum install tree
  bat: apt install bat | brew install bat | https://github.com/sharkdp/bat
<<<<<<< HEAD
=======
  https://docs.conda.io/en/latest/miniconda.html
>>>>>>> 2a80082883c67fae93d715f61927ee75f1435777
  https://ohmyz.sh/
  https://sqlitebrowser.org/
  https://dbeaver.io
  https://code.visualstudio.com/Download
  https://www.jetbrains.com/pycharm/download/
  https://www.jetbrains.com/idea/download/
  https://www.postman.com/downloads/
  https://www.docker.com/products/docker-desktop

EOF

# end
