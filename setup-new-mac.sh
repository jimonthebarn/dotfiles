# zhs init
. ./zsh/zsh.sh

# brew init
. ./brew/brew.sh

# osx init

# hold off our horses here for the mac specific stuff as it has not been reviewed for quote some time
# . ./osx/osx.sh

echo "Copying dotfiles from Github"
cd ~ || exit
git clone --recursive git@github.com:jimonthebarn/dotfiles.git dotfiles
cd ~/dotfiles && rake
