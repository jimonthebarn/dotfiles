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