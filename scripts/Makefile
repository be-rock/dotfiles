.DEFAULT_GOAL := help
SHELL := /bin/bash

# Define color variables
GREEN  := \033[32m
CYAN   := \033[36m
YELLOW := \033[33m
RESET  := \033[0m

help: ## Show this help message 📋
	@echo 'Usage: make [target]'
	@echo 'targets:'
	@echo
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

# log <level> <message>
log = printf '$(GREEN)%s$(RESET) | $(YELLOW)%s$(RESET) | $(CYAN)%s$(RESET)\n' \
	"$$(date +%Y-%m-%dT%H:%M:%S%z)" "$(strip $(1))" "$(strip $(2))"

.PHONY: test
test: ## test the logger
	@$(call log, INFO, hello world logger)

.PHONY: maestral
maestral: ## start and background the maestral client
	@$(call log, INFO, starting maestral ♻️)
	source $$HOME/.venv/default/bin/activate && maestral gui &

.PHONY: ecr-login
ecr-login: ## aws ☁️  ecr login (ℹ️  note AWS* environment variables need to be preset)
	aws ecr get-login-password --region $${AWS_REGION} | docker login --username AWS --password-stdin $${AWS_ACCOUNT_ID}.dkr.ecr.$${AWS_REGION}.amazonaws.com

.PHONY: mkvenv
mkvenv: ## make a new python 🐍 venv using an installed uv version. example `make mkvenv python_version=3.11.12`
	@echo -e "$(GREEN)$$(date +%Y-%m-%dT%H:%M:%S.%3N%z)$(RESET) | $(YELLOW)INFO$(RESET) | $(CYAN)create new python 🐍 venv in dir . with version $(python_version) 🚦$(RESET)"
	uv python pin $(python_version) && uv venv .venv && source .venv/bin/activate
	@echo -e "$(GREEN)$$(date +%Y-%m-%dT%H:%M:%S.%3N%z)$(RESET) | $(YELLOW)INFO$(RESET) | $(CYAN)create new python 🐍 venv in dir . with version $(python_version) 🏁$(RESET)"

