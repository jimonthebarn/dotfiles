#!/bin/bash

kill_java() {
    java_pids="$(pgrep java)"
    pids_number=$(pgrep java | wc -l)

    if [ "$pids_number" -gt 0 ]; then
        printf 'Killing Java processes:\n%s' "$java_pids"
        kill -9 "$java_pids"
    else
        printf "No Java process to kill."
    fi
}
