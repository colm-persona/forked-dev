#!/usr/bin/env bash

# Install tmux
if test "$(uname)" == "Darwin"; then
  brew install tmux
else if test "$(uname)" == "Linux"; then
  sudo apt-get install tmux
else
  echo "Unsupported OS"
  exit 1
fi

# Install tpm and plugins
if test ! -d ~/.tmux/plugins/tpm; then
  echo 'Installing tmux plugin manager...'
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
  ~/.tmux/plugins/tpm/bin/install_plugins
else
  echo 'Tmux plugin manager already installed'
fi
