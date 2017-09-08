# create symlinks
# ln -s /path/to/original /path/to/link

mkdir -p ~/dotfiles/.alias

if [[ ! -a ~/.alias ]]; then
    ln -s ~/dotfiles/.alias ~/.alias
fi

mkdir -p ~/dotfiles/.functions
if [[ ! -a ~/.functions ]]; then
    ln -s ~/dotfiles/.functions ~/.functions
fi

if [[ ! -a ~/.gitexcludes ]]; then
    ln -s ~/dotfiles/.gitexcludes ~/.gitexcludes
fi

#backup .zshrc and symlink
if [[ -a ~/.zshrc ]]; then
    echo "Backing up existing ~/.zshrc"
    mv ~/.zshrc ~/.zshrc.backup
fi

ln -s ~/dotfiles/.zshrc ~/.zshrc
