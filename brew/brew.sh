echo "Brew config"

# Check for Homebrew,
# Install if we don't have it
if test ! $(command -v brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow
brew install gist

echo "Installing other brew stuff..."
brew install wget
brew install cowsay
brew install glances
brew install shellcheck
brew install httpie
brew install maven
brew install gradle
brew install ack
brew install direnv
brew install terminal-notifier

echo "Cleaning up brew"
brew cleanup

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

# Apps
apps=(
 alfred
 chrome
 private-internet-access
 bartender
 harvest
 qlcolorcode
 suspicious-package
 bettertouchtool
 hipchat
 qlmarkdown
 transmission
 iterm2
 qlstephen
 transmit
 cleanmymac
 vagrant
 skype
 vlc
 nvalt
 sourcetree
 dropbox
 spotify
 seil
 slack
 Karabiner-Elements
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

brew cask cleanup
brew cleanup

echo "Brew Done!"