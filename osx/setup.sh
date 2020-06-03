if test ! "$(command -v brew)"; then
	  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew install git git-extras legit git-flow wget trash imagemagick cowsay fortune
brew cleanup