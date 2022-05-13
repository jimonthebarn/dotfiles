#This command takes your last command and sticks it in the general.sh alias file with whatever alias you specify

new-alias() {
  local last_command=$(echo `history |tail -n2 |head -n1` | sed 's/[0-9]* //')
  createAlias general $1 "'""$last_command""'"
}