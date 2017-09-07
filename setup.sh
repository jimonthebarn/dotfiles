# ----------------------------------------------------------------
# Setup: add the following line to your ~/.zshrc or ~/.bashrc file
# source ~/.alias/.setup
# ----------------------------------------------------------------

# source all alias files
for alias_file (~/.alias/.*.sh); do
        source $alias_file
done

createAlias() {
    if [[ $# -eq 3 ]]; then
        if which $2 > /dev/null; then
                echo "Alias $2 already exists."
        else
                mkdir -p ~/.alias

                echo "alias $2=\"$3\"" >> ~/.alias/.$1.sh
                source ~/.alias/.$1.sh
        fi
    elif [[ $# -eq 2 ]]; then
            createAlias general $1 $2
    else
            echo "Usage: \tcreateAlias <fileName> <aliasName> <alias>"
            echo "Example: \tcreateAlias npm nis \"npm install -save\""
            return 1
    fi
}

gcdir() {
    REPO=$1
    CLONEPATH=$2

    if [ -z $CLONEPATH ]; then
        CLONEPATH=${$(basename $1)/.git/}
    fi

    git clone $REPO $CLONEPATH
    cd $CLONEPATH
}

up() {
    LIMIT=$1
    P=$PWD

    for ((i=1; i <= LIMIT; i++))
    do
        P=$P/..
    done
    cd $P
    export MPWD=$P
}

back() {
    LIMIT=$1
    P=$MPWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=${P%/..}
    done
    cd $P
    export MPWD=$P
}

randomAlias() {
    aliases_all="$(alias)"
    aliases_size=$(alias | wc -l)

    alias_index_selected=$(( ( RANDOM % $aliases_size )  + 1 ))

    echo "Recommended alias of the day:"
    echo "$aliases_all" | sed -n "$alias_index_selected"p
}