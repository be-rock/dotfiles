# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh plugins
plugins=(git
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# dotfiles
for file in $HOME/.{exports,aliases,functions,misc}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        source "$file"
    fi
done
unset file

# .env
source_env ~/.env

# zsh settings
export KEYTIMEOUT=1
bindkey -v
# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# zsh auto suggestion
#bindkey '\t' end-of-line
#bindkey '\t' autosuggest-accept

# k8s
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

# zsh autosuggest
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# starship
eval "$(starship init zsh)"

# fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh


export PATH="$HOME/.local/bin:$HOME/.local/lib:/usr/local/go/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
