up() {
    LIMIT=$1
    P=$PWD

    for ((i=1; i <= LIMIT; i++))
    do
        P=$P/..
    done
    cd "$P" || exit 1
    export MPWD=$P
}