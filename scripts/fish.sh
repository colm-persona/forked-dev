#!/usr/bin/env bash

# Install fish shell and set it as default shell
if "$(uname)" == "Darwin"; then
  brew install -y fish
elif "$(uname)" == "Linux"; then
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo apt-get update
  sudo apt-get install -y fish
else
  echo "Unsupported OS"
  exit 1
fi

# set fish as default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
