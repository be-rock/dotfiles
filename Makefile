.DEFAULT_GOAL := help
DOTFILES_DIR ?= ~/code/git/dotfiles
VENV_DIR=/tmp/venv

help: ## Show this help message.
	@echo 'Usage: make [target] ...'
	@echo 'targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

.PHONY: prereq
prereq: ## ensure prereqs are in place
	python3 -m venv ${VENV_DIR}
	${VENV_DIR}/bin/pip install --upgrade pip ansible

.PHONY: setup
setup: ## setup dotfiles
setup: prereq
	${VENV_DIR}/bin/ansible-playbook ansible/playbook.yml \
	  --inventory ansible/hosts.ini \
	  --extra-vars dotfiles_dir=${DOTFILES_DIR} \
	  --tags brew # --skip-tags apt
# 	  --tags all # --skip-tags apt
