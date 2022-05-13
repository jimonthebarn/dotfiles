killAll() {
    if [[ $# -eq 1 ]]; then
        for pid in $(pgrep $1); do kill -9 $pid; done
    else
        printf "Kill process by name or regex"
        printf "Usage: \t\tkillAll <process name>"
        printf "Example: \tkillAll java"
    fi
}