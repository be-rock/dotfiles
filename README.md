# dotfiles

## Overview

All configs including the list of libraries that will be installed can be adjusted in `vars/default_config.yaml`

### Mac

1. Clone or download this repo.
2. Install [homebrew](https://brew.sh/)
3. Run the ansible playbook via: `make setup`
    - This will create a python virtual environment using the system python and install ansible
    - And then run the playbook

### Linux

1. Clone or download this repo.
2. Add the current user to the sudoers file with `sudo visudo` and `username ALL=(ALL:ALL) NOPASSWD:ALL`. Note that the entry *must* be appended to the end of the file.
3. Run the ansible playbook via: `make setup`
    - This will create a python virtual environment using the system python, and install ansible
    - And then run the playbook
