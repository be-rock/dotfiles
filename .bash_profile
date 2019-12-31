# .bashrc

for file in $HOME/.{aliases,exports,functions,misc}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        source "$file"
    fi
done
unset file

# end
