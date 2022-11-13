#!/usr/bin/env bash

DOTFILES_DIR="${DOTFILES_DIR:-~/code/git/dotfiles}"

# run a specific tasks with --tags ansibleTag
ansible-playbook ansible/playbook.yml -i ansible/hosts.ini \
    --extra-vars dotfiles_dir=$DOTFILES_DIR \
    --tags test
