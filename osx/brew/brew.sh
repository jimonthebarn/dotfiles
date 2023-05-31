echo "Homebrew init"

# Check for Homebrew,
# Install if we don't have it
if test ! "$(command -v brew)"; then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Install homebrew packages..."
# Maintenance task: Use the following to create a new bundle based on what is currently installed:
# create new: brew bundle dump --force
# update Brewfile according to your current setup: brew bundle --force cleanup
brew bundle --file ./osx/brew/Brewfile

echo "Cleaning up homebrew..."
brew cleanup
brew cask cleanup

echo "Brew Done!"