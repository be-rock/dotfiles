# .bashrc

for file in $HOME/.{aliases,exports,functions,misc,sqliterc,vimrc}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        source "$file"
    fi
done
unset file


parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[01;32m\]\t:\[\033[1;34m\]\u@\h\[\033[00m\][\[\033[01;32m\]\w\[\033[00m\]]\$(parse_git_branch)\$ "

# end
