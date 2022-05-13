addQuote() {
    if [[ $# -eq 1 ]]; then
        echo "'$1' by 'unknown'\r" >> ~/dotfiles/misc/quotes.txt
    elif [[ $# -eq 2 ]]; then
        echo "'$1' by '$2'\r" >> ~/dotfiles/misc/quotes.txt
    else
        echo "Usage: \taddQuote '<your quote>' ''"
        echo "Example: \taddQuote 'Dress for the job you want, not the job you have.'"
        return 1
    fi
}