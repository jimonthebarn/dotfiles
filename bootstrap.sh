#setup customized by OS
if command apt > /dev/null; then
  ./debian/setup.sh
elif [ "$(uname)" == "Darwin" ]; then
	./osx/setup.zsh
fi

chsh -s "$(command -v zsh)"

# make sure os gem is present
gem install os

#symlink our dotfiles into default locations in the homedir
cd ~/dotfiles || exit 1
rake