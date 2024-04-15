#!/usr/bin/env bash

if test "$(uname)" == "Darwin"; then
  xcode-select --install
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
  brew update
  brew upgrade
  brew install docker
else if test "$(uname)" == "Linux"; then
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install git
  sudo apt-get install docker
else
  echo "Unsupported OS"
  exit 1
fi
