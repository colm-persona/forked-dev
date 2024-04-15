#!/usr/bin/env bash

if test "$(uname)" == "Darwin"; then
  xcode-select --install
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sh
  brew update
  brew upgrade
  brew install -y docker
elif test "$(uname)" == "Linux"; then
  sudo apt-get update && apt-get upgrade
  sudo apt-get install -y git docker
else
  echo "Unsupported OS"
  exit 1
fi
