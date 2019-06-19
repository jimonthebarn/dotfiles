randomAlias() {
    aliases_all="$(alias)"
    aliases_size=$(alias | wc -l)

    alias_index_selected=$(( ( RANDOM % $aliases_size )  + 1 ))

    echo "$aliases_all" | sed -n "$alias_index_selected"p
}