#This command takes your last command and sticks it in your ~/.bash_profile with whatever alias you specify

new-alias() {
  local last_command=$(echo `history |tail -n2 |head -n1` | sed 's/[0-9]* //')
  echo alias $1="'""$last_command""'" >> ~/.bash_profile
  . ~/.bash_profile
}