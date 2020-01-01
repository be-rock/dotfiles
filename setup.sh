#!/usr/bin/env bash

# create symlinks if files dont already exist
for file in .{aliases,exports,functions,misc,sqliterc,vimrc}; do
    if [[ ! -r "$HOME/$file" ]] ; then
        echo "Executing: ln -s $HOME/git/dotfiles/$file $HOME/$file ..."
        ln -s $HOME/git/dotfiles/$file $HOME/$file
        echo "Return code: $?"
    fi
done
unset file

cat << EOF
Other installation considerations:
  bat - https://github.com/sharkdp/bat
  tree - sudo apt install tree | brew install tree | yum install tree 
  oh-my-zsh - https://ohmyz.sh/
EOF

#if [ $(uname -s) = 'Darwin' ]; then
#    #
#elif [ $(uname -s) = 'Linux' ] && [ -a /etc/debian_version ]; then
#    #
#elif [ $(uname -s) = 'Linux' ] && [ -a /etc/redhat-release ]; then
#    #
#fi

#end
