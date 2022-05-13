issOfBranch() {
    local currBranch=$(git branch --show-current)
    local issueName=$(echo "$currBranch" | sed -re 's/[0-9]*-(hmpop-[0-9]*)-.*/\1/')
    iss "$issueName"
}