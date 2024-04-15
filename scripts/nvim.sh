#!/usr/bin/env bash

# get dependencies
if test "$(uname)" == "Darwin"; then
  brew install -y ninja cmake gettext curl lua5.4
elif test "$(uname)" == "Linux"; then
  sudo apt-get install -y ninja-build gettext cmake unzip curl build-essential
else
  echo "Unsupported OS"
  exit 1
fi

# build neovim
git clone https://github.com/neovim/neovim.git ~/neovim
CWD=$(pwd)
cd ~/neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd $CWD

# get our configuration's dependencies
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install plugins and quit when done
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'


