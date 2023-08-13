# dotfiles

## Getting Started

### Mac

1. Clone or download this repo to the modifiable directory specified in `ansible/vars/default_config.yaml` key: `dotfiles_dir`. Alternatively, the environment variable `DOTFILES_DIR` could be exported to the path of interest.
2. Install [homebrew](https://brew.sh/)
3. Install [rye](https://rye-up.com/guide/installation/), [pyenv](https://github.com/pyenv/pyenv), [miniconda](https://docs.conda.io/en/latest/miniconda.html) or use a pre-existing python environment
4. `pip install ansible pipx` or if using `rye` then: `rye tools install ansible`
5. Run the playbook via: `./bootstrap.sh`

### Linux

1. Clone or download this repo to the modifiable directory specified in `ansible/vars/default_config.yaml` key: `dotfiles_dir`. Alternatively, the environment variable `DOTFILES_DIR` could be exported to the path of interest.
2. Install [rye](https://rye-up.com/guide/installation/), [pyenv](https://github.com/pyenv/pyenv), [miniconda](https://docs.conda.io/en/latest/miniconda.html) or use a pre-existing python environment
3. `pip install ansible pipx` or if using `rye` then: `rye tools install ansible`
4. Add the current user to the sudoers file with `sudo visudo` and `username ALL=(ALL:ALL) NOPASSWD:ALL`. Note that the entry *must* be appended to the end of the file.
5. Run the playbook via: `./bootstrap.sh`
