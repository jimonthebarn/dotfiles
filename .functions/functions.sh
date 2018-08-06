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

idea() {
    # Determine where intellij is installed
    DEFAULT_IDEA_TOOLBOX_LOCATION=$(ls -1d ~/Library/Application\ Support/JetBrains/Toolbox/apps/*/*/*/IntelliJ\ IDEA.app 2>&1 | tail -n1)
    DEFAULT_IDEA_LOCATION=$(ls -1d /Applications/IntelliJ\ IDEA.app 2>&1 | tail -n1)

    IDEA=""
    if [[ $DEFAULT_IDEA_TOOLBOX_LOCATION = *"No such file or directory"* ]]; then
        IDEA="$DEFAULT_IDEA_LOCATION"
    elif [[ $DEFAULT_IDEA_LOCAITON = *"No such file or directory"* ]]; then
        echo "No intellij installation found, cannot proceed"
        exit 1
    else
        IDEA="$DEFAULT_IDEA_TOOLBOX_LOCATION"
    fi

    # Check current working directory
    wd=""
    if [ -z "$1" ]; then
        wd=$(pwd)
    elif [ -d "$1" ]; then
        wd=$(ls -1d "$1" 2>&1 | head -n1)
    fi

    # Check if we were given a file
    if [ -f "$1" ]; then
        open -a "$IDEA" "$1"
    else
        # Check working directory
        #pushd $wd > /dev/null

        if [ -d ".idea" ]; then
            # Handle .idea folders
            echo "Opening based on .idea folder"
            open -a "$IDEA" .
        elif ls *.ipr 1> /dev/null 2>&1; then
            # Handle idea project files
            echo "Opening based on *.ipr"
            open -a "$IDEA" `ls -1d *.ipr | head -n1`
        elif [ -f "pom.xml" ]; then
            # Handle pom.xml
            echo "Opening based on pom.xml"
            open -a "$IDEA" "pom.xml"
        else
            # Can't do anything else, just open Intellij
            open "$IDEA"
        fi

        #popd > /dev/null
    fi
}

pofo() {
    oc get pods | grep $1 | grep Running | sed 's/^\([^ ][^ ]*\) .*/oc port-forward \1 8080/'
}

findGrep() {
    find . -name "$1" -exec grep "$2" '{}' \; -print
}
