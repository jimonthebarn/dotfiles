createAlias() {
    if [[ $# -eq 3 ]]; then
        if which $2 > /dev/null; then
                echo "Alias $2 already exists."
        else
                echo "alias $2=\"$3\"" >> ~/.alias/$1.sh
                source ~/.alias/$1.sh
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

    echo "$aliases_all" | sed -n "$alias_index_selected"p
}

killJava() {
    java_pids="$(pgrep java)"
    pids_number=$(pgrep java | wc -l)

    if [ $pids_number -gt 0 ]; then
        echo "Killing Java processes:\n"$java_pids
        kill -9 $java_pids
    else
        echo "No Java process to kill."
    fi
}

killAll() {
    for pid in $(pgrep $1); do kill -9 $pid; done
}

setJdk() {
    if [[ $# -eq 1 ]]; then
        export JAVA_HOME=$(/usr/libexec/java_home --version $1)
    else
        echo "Usage: \t\tsetJdk <javaVersion>"
        echo "Example: \tsetJdk 1.8"
        echo  "Available versions are:"
        /usr/libexec/java_home --verbose
    fi
}
