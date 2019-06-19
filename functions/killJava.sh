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
