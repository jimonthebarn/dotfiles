alias svhpg="jmpstag && shuttlepg"
alias jmpstag="az ssh config --ip jump-staging.smartvoicehub.de --file ./jump-config"
alias shuttlepg="sshuttle -r jump-staging.smartvoicehub.de -e \"ssh -F ./jump-config -p 1077\" --dns 10.0.0.0/8:5432"