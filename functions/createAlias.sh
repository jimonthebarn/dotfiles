createAlias() {
    if [[ $# -eq 3 ]]; then
        if which $2 > /dev/null; then
            echo "Alias $2 already exists."
        else
            echo "alias $2=\"$3\"" >> ~/dotfiles/alias/$1.sh
            source ~/dotfiles/alias/$1.sh
        fi
    elif [[ $# -eq 2 ]]; then
        createAlias general "$1 $2"
    else
        echo "Usage: \tcreateAlias <fileNameWithoutExtension> <aliasName> <alias>"
        echo "Example: \tcreateAlias npm nis 'npm install -save'"
        return 1
    fi
}