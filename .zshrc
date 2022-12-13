# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh plugins
plugins=(aws
    git
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)

#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
#zle_highlight=(region:bg=#264F78) # Added before sourcing of z-sy-h

source $ZSH/oh-my-zsh.sh

# dotfiles
for file in $HOME/.{exports,aliases,functions,misc}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        source "$file"
    fi
done
unset file

shell_settings_enable() {
  export KEYTIMEOUT=10 # The time the shell waits, in hundredths of seconds, for another key to be pressed when reading bound multi-character sequences. 
  bindkey jk vi-cmd-mode # exit from insert mode
  bindkey -v # Use vim cli mode
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
}

misc_settings_enable() {
  # .env
  source_env ~/.env

  # k8s
  if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
  
  # zsh autosuggest
  source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  
  # starship
  eval "$(starship init zsh)"
  
  # fzf
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  
  # java
  export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
}

shell_settings_enable
misc_settings_enable

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"



export PATH="$HOME/.local/bin:$HOME/.local/lib:/usr/local/go/bin:$JAVA_HOME/bin:$PATH"

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
