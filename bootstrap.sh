#!/usr/bin/env bash

DOTFILES_DIR="${DOTFILES_DIR:-~/code/git/dotfiles}"
DESKTOP_OS_DISTRIBUTION="${DESKTOP_OS_DISTRIBUTION:-'Pop!_OS'}"
PIHOLE_IP="${PIHOLE_IP:-'localhost'}"

ansible-playbook ansible/playbook.yml -i ansible/hosts.ini && \
    --extra-vars "dotfiles_dir=$DOTFILES_DIR" && \
    --extra-vars "desktop_os_distribution=$DESKTOP_OS_DISTRIBUTION" && \
    --extra-vars "pihole_ip=$PIHOLE_IP"
