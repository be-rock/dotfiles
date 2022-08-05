#!/usr/bin/env bash

DOTFILES_DIR="${DOTFILES_DIR:-~/code/git/dotfiles}"
PIHOLE_IP="${PIHOLE_IP:-'localhost'}"

ansible-playbook ansible/playbook.yml -i ansible/hosts.ini --extra-vars dotfiles_dir=$DOTFILES_DIR --extra-vars pihole_ip=$PIHOLE_IP
