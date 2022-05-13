createAlias() {
    if [[ $# -eq 3 ]]; then
        local FILENAME=$1
        local ALIAS=$2
        local VALUE=$2
        if which "$ALIAS" > /dev/null; then
            echo "Alias $ALIAS already exists."
        else
            echo "alias $ALIAS=\"$VALUE\"" >> "$HOME/dotfiles/alias/$FILENAME"
            # shellcheck source=src/util.sh
            source "$HOME/dotfiles/alias/$FILENAME.sh"
        fi
    elif [[ $# -eq 2 ]]; then
        createAlias general "$1 $2"
    else
        printf "Usage: \tcreateAlias <fileNameWithoutExtension> <aliasName> <alias>"
        printf "Example: \tcreateAlias npm nis 'npm install -save'"
        return 1
    fi
}