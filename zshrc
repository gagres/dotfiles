# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

plugins=(
	git
	docker-compose
	docker
)

source $ZSH/oh-my-zsh.sh

# Docker aliases
if [ -f ~/.docker_aliases ]; then
    . ~/.docker_aliases
fi

# Command to see the weather =]
alias ttemp="curl wttr.in"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion