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

  ## History command configuration
#   setopt extended_history       # record timestamp of command in HISTFILE
#   setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
#   setopt hist_ignore_dups       # ignore duplicated commands history list
#   setopt hist_ignore_space      # ignore commands that start with space
#   setopt hist_verify            # show command with history expansion to user before running it
#   setopt share_history          # share command history data

#   # zsh completion
#   # ref: https://thevaluable.dev/zsh-completion-guide-examples/
    # https://github.com/zsh-users/zsh-completions
    fpath=(~/.zsh/completions/src $fpath)
    autoload bashcompinit && bashcompinit
    autoload -Uz compinit && compinit -i
    #autoload -U compinit && compinit
#   zmodload -i zsh/complist
#   zstyle ':completion:*' menu select
    #autoload -U compinit
    compinit -i
}

misc_settings_enable() {
  # .env
  if [ -f ~/.env ]; then source ~/.env; fi

  # k8s
  if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

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
}

source_zsh_plugins() {
  source ~/.zsh/completion.zsh
  source ~/.zsh/gh-completion.zsh
  source ~/.zsh/history.zsh
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/.zsh/z.plugin.zsh
}

shell_settings_enable
misc_settings_enable
pyenv_settings_enable
source_zsh_plugins

export PATH="$HOME/.local/bin:$HOME/.local/lib:$JAVA_HOME/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
