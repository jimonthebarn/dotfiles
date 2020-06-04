git clone --recursive git@github.com:jimonthebarn/dotfiles.git ~/dotfiles

#setup customized by OS
if command apt > /dev/null; then
  ./debian/setup.sh
elif [ "$(uname)" == "Darwin" ]; then
	./osx/setup.zsh
fi

chsh -s "$(command -v zsh)"

#symlink our dotfiles into default locations in the homedir
cd ~/dotfiles && rake