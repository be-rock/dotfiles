set shell := ["bash", "-c"]

# print this help 📋
@default:
  just --list

# make a new python 🐍 venv using an installed rye toolchain
[no-cd]
mkvenv python_version:
    @echo "$(date +%Y-%m-%dT%H:%M:%S.%3N%z) | INFO | create new python venv - start"
    rye pin {{ python_version }} && python -m venv .venv && source .venv/bin/activate
    @echo "$(date +%Y-%m-%dT%H:%M:%S.%3N%z) | INFO | create new python venv - finish"

# aws ☁️  ecr login (AWS* environment variables need to be preset)
ecr-login:
    aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

# a test 🧪 recipe
zztestrecipe:
    echo $SHELL
    @echo "Running from {{justfile_directory()}}/subdirectory"
