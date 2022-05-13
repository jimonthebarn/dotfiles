killAll() {
    if [[ $# -eq 1 ]]; then
        for pid in $(pgrep $1); do kill -9 $pid; done
    else
        echo "Kill process by name or regex"
        echo "Usage: \t\tkillAll <process name>"
        echo "Example: \tkillAll java"
    fi
}