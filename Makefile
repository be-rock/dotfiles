.DEFAULT_GOAL := help

help: ## Show this help message.
    @echo -e 'Usage: make [target] ...\n'
    @echo 'targets:'
    @egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

.PHONY: ecr-login
ecr-login: ## ecr login
	aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

.PHONY: lambda-zip
lambda-zip: ## create a lambda zip file
	python -m venv .venv
	.venv/bin/pip install --upgrade pip --requirement src/requirements.txt
	cd .venv/lib/python*/site-packages && zip -r ${CURDIR}/my-deployment-package.zip --exclude="pip*" .
	zip -g my-deployment-package.zip src/lambda_function.py

ZZ
