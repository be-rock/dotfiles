# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh plugins
plugins=(aws
    git
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

shell_settings_enable() {
  export KEYTIMEOUT=10   # The time the shell waits, in hundredths of seconds, for another key to be pressed when reading bound multi-character sequences. 
  bindkey jk vi-cmd-mode # exit from insert mode
  bindkey -v             # Use vim cli mode
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
  if [ -f ~/.env ]; then
    source_env ~/.env
  fi

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

pyenv_settings_enable() {
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  #eval "$(pyenv virtualenv-init -)"
}

shell_settings_enable
misc_settings_enable
pyenv_settings_enable

export PATH="$HOME/.local/bin:$HOME/.local/lib:$JAVA_HOME/bin:$PATH"

