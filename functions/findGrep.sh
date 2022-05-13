findGrep() {
    if [[ $# -eq 2 ]]; then
        find . -name "$1" -exec grep "$2" '{}' \; -print
    else
        printf "Usage: \t\tfindGrep <fileName> <text>"
        printf "Example: \tfindGrep license.txt 'lgpl'"
    fi
}