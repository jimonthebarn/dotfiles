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
export PATH=$HOME/.pyenv/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/AppLauncher:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

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
	#cask
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
	ssh-agent
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
export SSH_KEY_PATH="${HOME}/.ssh/rsa_id"

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
# Gradle
################################
# find os agnostic way
#export GRADLE_HOME=$(brew info gradle | grep /usr/local/Cellar/gradle | awk '{print $1}')

################################
# Git
################################
# enable git-extras autocompletion
if [ -d /usr/local/opt/git-extras/ ]; then source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh; fi

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
eval "$(pyenv virtualenv-init -)"

################################
# Kubectl
################################
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

################################
# SDKMAN
################################
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

################################
# SVH
################################
export SH_CLI_HOME="${HOME}/Workspace/smarthub/cloud/smarthub-client-cli"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

cowalias
