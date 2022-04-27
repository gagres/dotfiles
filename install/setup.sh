#!/bin/bash

kernelName="$(uname -s)"

if [ "$kernelName" = "Darwin" ]; then
  # Update brew and install dependencies
  brew update && brew bundle
elif [ "$kernelName" = "Linux" ]; then
  # Run script to install ubuntu packages
  source ~/.dotfiles/install/ubuntu.sh
fi

# Clone Tmux Plugin Manager
if [ ! -d "$HOME/.tmux/plugins" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install nvm
if [ ! -d "$HOME/.nvm" ]; then
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
fi

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  wget -P /tmp https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
  sh /tmp/install.sh
fi

# Install last version of PHP and Composer
source ~/.dotfiles/install/php.sh

# Install last version of python
source ~/.dotfiles/install/python.sh

# Generate symlinks
env RCRC=$HOME/.dotfiles/rcrc rcup
rcup -v

# Set zsh as default shell
chsh -s $(which zsh)