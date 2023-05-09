alias gpom="git push origin master"
#alias git='hub'
alias glfm='git log origin/master ^master'
alias gitkill='git filter-repo --invert-paths --path '
alias gitprune='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
