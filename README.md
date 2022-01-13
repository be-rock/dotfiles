# dotfiles

## Getting Started

### Mac

1. Clone or download this repo to the modifiable directory specified in `ansible/vars/default_config.yaml` key: `dotfiles_dir`
2. Install [homebrew](https://brew.sh/`)
3. Install [miniconda](https://docs.conda.io/en/latest/miniconda.html) or use a pre-existing python environment
4. `pip install ansible`
5. Run the playbook via: `./bootstrap.sh`

### Linux

1. Clone or download this repo to the modifiable directory specified in `ansible/vars/default_config.yaml` key: `dotfiles_dir`
2. Install [miniconda](https://docs.conda.io/en/latest/miniconda.html) or use a pre-existing python environment
3. `pip install ansible`
4. Add the current user to the end of the sudoers file with `sudo visudo` and `username ALL=(ALL:ALL) NOPASSWD:ALL`
5. Run the playbook via: `./bootstrap.sh`
