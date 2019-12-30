ZSH_THEME="duellj"
HIST_STAMPS="yyyy-mm-dd"

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

# bat follow - https://github.com/sharkdp/bat
function batf() {
    tail -f "$1" | bat --paging=never;
}

export HISTSIZE=10000
export HISTFILESIZE=10000
source $HOME/config/.alias
