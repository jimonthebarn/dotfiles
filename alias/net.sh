alias port='port(){sudo lsof -i tcp:"$1"}; port'
alias lports="sudo lsof -iTCP -sTCP:LISTEN -n -P"
alias myip="curl ifconfig.me"
alias tunnelPbs="ssh -L 10443:10.223.153.104:443 -L 3306:gcpdev.psst.t-online.corp:3306 -p 56022 -l broth -N -n -A 192.166.192.88"
alias tunnelGcp="ssh -L 10443:10.223.153.104:443 -L 3306:gcpdev.psst.t-online.corp:3306 -p 56022 -l broth -N -n -A 192.166.192.88"