pofo() {
    if [[ $# -eq 1 ]]; then
        oc get pods | grep $1 | grep Running | sed 's/^\([^ ][^ ]*\) .*/oc port-forward \1 8080/'
    else
        echo "Usage: \t\tpofo <podname>"
        echo "Example: \tpofo canned"
    fi
}