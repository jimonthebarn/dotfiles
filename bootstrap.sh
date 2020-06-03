git clone --recursive git@github.com:jimonthebarn/dotfiles.git ~/dotfiles

if [ "$(uname)" == "Darwin" ]; then
	if test ! "$(command -v brew)"; then
	  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	brew install git git-extras legit git-flow wget trash imagemagick cowsay fortune
	brew cleanup
fi

chsh -s "$(command -v zsh)"
cd ~/dotfiles && rake