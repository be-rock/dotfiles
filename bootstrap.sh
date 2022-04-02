#!/usr/bin/env bash

ansible-playbook playbook.yml -i .hosts.ini --extra-vars dotfiles_dir=$DOTFILES_DIR
