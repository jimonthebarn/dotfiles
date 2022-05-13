addQuote() {
    if [[ $# -eq 1 ]]; then
        printf "'%s' by 'unknown'\r" "$1" >> ~/dotfiles/misc/quotes.txt
    elif [[ $# -eq 2 ]]; then
        printf "'%s' by '%s'\r" "$1" "$2" >> ~/dotfiles/misc/quotes.txt
    else
        printf "Usage: \taddQuote '<your quote>' ''"
        printf "Example: \taddQuote 'Dress for the job you want, not the job you have.'"
        return 1
    fi
}