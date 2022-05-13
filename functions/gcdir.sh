gcdir() {
    local REPO=$1
    local CLONEPATH=$2

    if [ -z "$CLONEPATH" ]; then
        CLONEPATH=${$(basename "$REPO")/.git/}
    fi

    git clone "$REPO" $CLONEPATH
    cd $CLONEPATH || exit 1
}