#!/usr/bin/env bash

DOTFILES_DIR="${DOTFILES_DIR:-~/code/git/dotfiles}" 

ansible-playbook playbook.yml -i .hosts.ini --extra-vars dotfiles_dir=$DOTFILES_DIR
