print "Starting setup"

# Lets assume the repo was cloned into ~/dotfiles like this:
# git clone --recursive git@github.com:jimonthebarn/dotfiles.git ~/dotfiles
cd ~/dotfiles || exit 1

# ZSH init
. ./../zsh/zsh.sh

# OSX init
# hold off our horses here for the mac specific stuff as it has not been reviewed for quote some time
# . ./customize.sh

print "Setup homebrew"
. ./brew/brew.sh