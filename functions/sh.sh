sh() {
    if [[ $# -eq 0 ]]; then
        query=$(basename ~+)
    elif [[ $# -eq 1 ]]; then
        query=$1
    else
        echo "Usage: \tsh"
        echo "Usage: \tsh <project name>"
        echo "Example: \tsh skill-canned-response-python'"
        return 1
    fi

    url="https://smarthub-wbench.wesp.telekom.net/gitlab/search?search=$query"
    open_command "$url"
}