findGrep() {
    if [[ $# -eq 2 ]]; then
        find . -name "$1" -exec grep "$2" '{}' \; -print
    else
        echo "Usage: \t\tfindGrep <fileName> <text>"
        echo "Example: \tfindGrep license.txt 'lgpl'"
    fi
}