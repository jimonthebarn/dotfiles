createAlias() {
    if [[ $# -eq 3 ]]; then
        if which $2 > /dev/null; then
            echo "Alias $2 already exists."
        else
            echo "alias $2=\"$3\"" >> ~/dotfiles/alias/$1.sh
            source ~/dotfiles/alias/$1.sh
        fi
    elif [[ $# -eq 2 ]]; then
        createAlias general "$1 $2"
    else
        echo "Usage: \tcreateAlias <fileNameWithoutExtension> <aliasName> <alias>"
        echo "Example: \tcreateAlias npm nis 'npm install -save'"
        return 1
    fi
}

addQuote() {
    if [[ $# -eq 1 ]]; then
        echo "$1" >> ~/dotfiles/quotes.txt
    else
        echo "Usage: \taddQuote '<your quote>'"
        echo "Example: \taddQuote 'Dress for the job you want, not the job you have.'"
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
    if [[ $# -eq 1 ]]; then
        for pid in $(pgrep $1); do kill -9 $pid; done
    else
        echo "Usage: \t\tkillAll <process name>"
        echo "Example: \tkillAll java"
    fi
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

pofo() {
    if [[ $# -eq 1 ]]; then
        oc get pods | grep $1 | grep Running | sed 's/^\([^ ][^ ]*\) .*/oc port-forward \1 8080/'
    else
        echo "Usage: \t\tpofo <podname>"
        echo "Example: \tpofo canned"
    fi
}

findGrep() {
    if [[ $# -eq 2 ]]; then
        find . -name "$1" -exec grep "$2" '{}' \; -print
    else
        echo "Usage: \t\tfindGrep <fileName> <text>"
        echo "Example: \tfindGrep license.txt 'lgpl'"
    fi
}

port() {
    sudo lsof -i tcp:$1 
}

sh() {
    if [[ $# -eq 0 ]]; then
        query=$(basename ~+)
    elif [[ $# -eq 1 ]]; then
        query=$1
    else
        echo "Usage: \tsh"
        echo "Usage: \tsh <project name>"
        echo "Example: \tsh skill-canned-response-python'"
        return 1
    fi

    url="https://smarthub-wbench.wesp.telekom.net/gitlab/search?search=$query"
    open_command "$url"
}

iss() {
    open_command "https://gard.telekom.de/gard/secure/QuickSearch.jspa?searchString=$1"
}
