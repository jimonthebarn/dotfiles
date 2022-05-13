print "Starting setup"

# Lets assume the repo was cloned into ~/dotfiles like this:
# git clone --recursive git@github.com:jimonthebarn/dotfiles.git ~/dotfiles
# TODO: adopt a more flexible approach like oh-my-zsh does by cloning and installing via a installer script:
# e.g. sh -c "$(curl -fsSL https://raw.githubusercontent.com/jimonthebarn/dotfiles/master/tools/install.sh)"
cd ~/dotfiles || exit 1
rake

# ZSH init
. ./../zsh/zsh.sh

# OSX init
# hold off our horses here for the mac specific stuff as it has not been reviewed for quote some time
# . ./customize.sh

print "Setup homebrew"
. ./brew/brew.sh