issOfBranch() {
    local CURR_BRANCH=$(git branch --show-current)
    local issueName=$(echo $CURR_BRANCH | sed -re 's/[0-9]*-(hmpop-[0-9]*)-.*/\1/')
    iss $issueName
}