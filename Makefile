.DEFAULT_GOAL := help
DOTFILES_DIR=~/code/git/dotfiles
VENV_DIR=~/.venv/dotfiles

help: ## Show this help message.
	@echo -e 'Usage: make [target] ...\n'
	@echo 'targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

.PHONY: setup
setup: ## setup dotfiles
	${VENV_DIR}/bin/ansible-playbook ansible/playbook.yml \
	  --inventory ansible/hosts.ini \
	  --extra-vars dotfiles_dir=${DOTFILES_DIR} #--tags testtag

.PHONY: brew-install
setup: ## install brew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
