MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
DOTFILES := "$(dir $(MKFILE_PATH))env"
TARGET_DIR = $$HOME

DOTFILES_LIST = \
	.zshrc \
	.tmux.conf\
	.config/hypr \
	.config/nvim

all: link

link: $(DOTFILES_LIST)

$(DOTFILES_LIST): update-nvim
	@ln -sfv $(DOTFILES)/$@ $(dir $(TARGET_DIR)/$@)

update-nvim:
	@git submodule update --init --recursive

.PHONY: ensure-oh-my-zsh
ensure-oh-my-zsh:
	@if [ ! -d ]; then \
		echo "Oh My Zsh not found. Installing..."; \
		RUNZSH=no CHSH=no sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
	fi
