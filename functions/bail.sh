bail() {
    tail -f "$1" | bat --paging=never -l log
}