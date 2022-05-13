mcicd() {
    if [[ $# -eq 0 ]]; then
        query=$(basename ~+)
    elif [[ $# -eq 1 ]]; then
        query=$1
    else
        echo "Usage: \tmcicd"
        echo "Usage: \tmcicd <project name>"
        echo "Example: \tmcicd handler'"
        return 1
    fi

    url="https://gitlab.devops.telekom.de/search?search=$query"
    open_command "$url"
}