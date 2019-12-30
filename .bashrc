# .bashrc

for file in $HOME/.{aliases,functions}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        source "$file"
    fi
done
unset file

# end
