#	                ██
#	               ░██
#	 ██████  ██████░██      ██████  █████
#	░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#	   ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#	  ██    ░░░░░██░██  ░██ ░██   ░██   ██
#	 ██████ ██████ ░██  ░██░███   ░░█████
#	░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################
# Custom
################################
export DOTFILES="$(dirname "$(readlink "$HOME/.zshrc")")"

# Enable interactive comments
setopt interactivecomments

zstyle :omz:plugins:ssh-agent agent-forwarding on


export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/Users/ben/AppLauncher:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES/zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/dotfiles/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/dotfiles/zsh-custom/plugins/
plugins=(
	adb
	#autojump
	bgnotify
	bower
	brew
	cask
	colored-man-pages
	colorize
	colorize
	docker
	encode64
	fasd
	git
	git-extras
	git-flow
	github
	#globalias
	golang
	gradle
	history
	httpie
	kubectl
	kubectl
	mvn
	npm
	oc
	osx
	pip
	pipenv
	safe-paste
	sdk
	spring
	#ssh-agent
	sublime
	sudo
	supervisor
	thefuck
	themes
	urltools
	web-search
	#z
	zsh-aliases-exa
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

################################
# SSH
################################
export SSH_KEY_PATH="~/.ssh/rsa_id"

################################
# Custom
################################
for alias_file ($DOTFILES/alias/*.sh); do
        source $alias_file
done

for function_file ($DOTFILES/functions/*.sh); do
        source $function_file
done

################################
# Java
################################
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`


################################
# Gradle
################################
export GRADLE_HOME=$(brew info gradle | grep /usr/local/Cellar/gradle | awk '{print $1}')

################################
# Git
################################
# enable git-extras autocompletion
source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

################################
# ZSH
################################
# enable zsh-completions manually since OMZ expects a different plugin structure than zsh-completions has
fpath=(/usr/local/share/zsh-completions $fpath)

################################
# direnv - https://direnv.net/
################################
eval "$(direnv hook zsh)"

################################
# Python
################################
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

################################
# Kubectl
################################
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

################################
# iTerm
################################
# set iterm tab titel to current dir
precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

# enable iTerm shell integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

################################
# GO
################################
export GOPATH="${HOME}/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

################################
# SDKMAN
################################
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ben/.sdkman"
[[ -s "/Users/ben/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ben/.sdkman/bin/sdkman-init.sh"

################################
# OpenSSL
################################
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

cowalias