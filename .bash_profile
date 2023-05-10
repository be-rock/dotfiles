# .bashrc

for file in $HOME/.{aliases,exports,functions,misc,sqliterc,vimrc}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        source "$file"
    fi
done
unset file

# end
. "$HOME/.cargo/env"
