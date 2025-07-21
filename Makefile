MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
DOTFILES := "$(dir $(MKFILE_PATH))env/.config"
TARGET_DIR = $$HOME/.config

DOTFILES_LIST = \
	hypr \
	nvim

all: link

link: $(DOTFILES_LIST)

$(DOTFILES_LIST): update-nvim
	@ln -sfv $(DOTFILES)/$@ $(TARGET_DIR)

update-nvim:
	@git submodule update --init --recursive
