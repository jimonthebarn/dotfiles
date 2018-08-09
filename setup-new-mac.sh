# zhs init
. ./zsh/zsh.sh

# brew init
. ./brew/brew.sh

# osx init
. ./osx/osx.sh

# osx init
. ./git/git.sh

echo "Copying dotfiles from Github"
cd ~
git clone --recursive git@github.com:jimonthebarn/dotfiles.git dotfiles
cd ~/dotfiles && rake
