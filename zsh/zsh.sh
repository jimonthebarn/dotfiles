echo "ZSH config"

chsh -s "$(which zsh)"

#install .oh-my-zsh
[ ! -d "${HOME}/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "ZSH Done!"