# Install fish shell and set it as default shell
if "$(uname)" == "Darwin"; then
  brew install fish
else if "$(uname)" == "Linux"; then
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo apt-get update
  sudo apt-get install fish
else
  echo "Unsupported OS"
  exit 1
fi

# set fish as default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
