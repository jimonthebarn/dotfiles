addQuote() {
    if [[ $# -eq 1 ]]; then
        echo "$1" >> ~/dotfiles/misc/quotes.txt
    else
        echo "Usage: \taddQuote '<your quote>'"
        echo "Example: \taddQuote 'Dress for the job you want, not the job you have.'"
        return 1
    fi
}