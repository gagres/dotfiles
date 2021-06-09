#!/bin/bash

# Run script to install ubuntu packages
source ~/.dotfiles/install/ubuntu.sh

# Clone Tmux Plugin Manager
if [ ! -d "$HOME/.tmux/plugins" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install nvm
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
fi

# Generate symlinks
env RCRC=$HOME/.dotfiles/rcrc rcup
rcup -v

# Set zsh as default shell
chsh -s $(which zsh)