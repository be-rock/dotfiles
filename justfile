set shell := ["bash", "-c"]

DOTFILES_DIR := env_var_or_default('DOTFILES_DIR', env_var('HOME') + '/code/git/dotfiles')
VENV_DIR := "/tmp/venv"

# Define color variables
GREEN := "\\u001b[32m"
CYAN := "\\u001b[36m"
YELLOW := "\\u001b[33m"
RESET := "\\u001b[0m"

# print this help 📋
@default:
  just --list

# make a new python 🐍 venv using an installed rye toolchain
[no-cd]
_setup_venv:
    @echo -e "{{GREEN}}$(date +%Y-%m-%dT%H:%M:%S.%3N%z){{RESET}} | {{YELLOW}}INFO{{RESET}} | {{CYAN}}create new python venv and pip install - start{{RESET}}"
    python -m venv {{ VENV_DIR }} && source {{ VENV_DIR }}/bin/activate && pip install --upgrade pip ansible
    @echo -e "{{GREEN}}$(date +%Y-%m-%dT%H:%M:%S.%3N%z){{RESET}} | {{YELLOW}}INFO{{RESET}} | {{CYAN}}create new python venv and pip install - finish{{RESET}}"

# setup dotfiles ⚪🗃️
setup: _setup_venv
    @echo -e "{{GREEN}}$(date +%Y-%m-%dT%H:%M:%S.%3N%z){{RESET}} | {{YELLOW}}INFO{{RESET}} | {{CYAN}}running ansible playbook - start{{RESET}}"
    {{ VENV_DIR }}/bin/ansible-playbook ansible/playbook.yml \
    --inventory ansible/hosts.ini \
    --extra-vars dotfiles_dir={{ DOTFILES_DIR }} \
    --tags all # --skip-tags apt
    @echo -e "{{GREEN}}$(date +%Y-%m-%dT%H:%M:%S.%3N%z){{RESET}} | {{YELLOW}}INFO{{RESET}} | {{CYAN}}running ansible playbook - finish{{RESET}}"
