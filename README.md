# dotfiles

## Overview

All configs including the list of libraries that will be installed can be adjusted in `vars/default_config.yaml`

### Mac

1. Clone or download this repo to a directory
2. Set the `DOTFILES_DIR` environment variable to that directory with: `export DOTFILES_DIR=/path/to/dotfiles` or update the variable of the same name in the `Makefile`
3. Install [homebrew](https://brew.sh/)
4. Run the ansible playbook via: `make setup`
    - This will create a python virtual environment using the system python and install ansible
    - And then run the playbook

### Linux

1. Clone or download this repo to a directory
2. Set the `DOTFILES_DIR` environment variable to that directory with: `export DOTFILES_DIR=/path/to/dotfiles` or update the variable of the same name in the `Makefile`
2. Add the current user to the sudoers file with `sudo visudo` and `username ALL=(ALL:ALL) NOPASSWD:ALL`. Note that the entry *must* be appended to the end of the file.
3. Run the ansible playbook via: `make setup`
    - This will create a python virtual environment using the system python, and install ansible
    - And then run the playbook
