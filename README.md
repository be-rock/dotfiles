# dotfiles

## Overview

This project requires some basic system-dependent setup incuding the installation of [just](https://github.com/casey/just) and then can be initiated with `just setup`. All configs including the list of libraries that will be installed can be adjusted in `vars/default_config.yaml`

## Mac

1. Clone or download this repo.
2. Install [homebrew](https://brew.sh/)
3. Install [just](https://github.com/casey/just), using `brew install just`
4. Run the ansible playbook via: `just setup`
    - This will create a python virtual environment using the system python, and install ansible
    - And then run the playbook

## Linux

1. Clone or download this repo.
2. Install [just](https://github.com/casey/just), using `sudo apt install just`
3. Add the current user to the sudoers file with `sudo visudo` and `username ALL=(ALL:ALL) NOPASSWD:ALL`. Note that the entry *must* be appended to the end of the file.
4. Run the ansible playbook via: `just setup`
    - This will create a python virtual environment using the system python, and install ansible
    - And then run the playbook
