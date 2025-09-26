MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
WP_DIR := "$(dir $(MKFILE_PATH))wallpapers"

include ../Makefile

all: install update-boot-conf nvim ensure-oh-my-zsh link sync-wallpapers

PACMAN_PACKAGES := tmux go steam lua51 luarocks base-devel cmake unzip ninja curl rofi-wayland waybar btop hyprpaper \
						wireplumber
YAY_PACKAGES := libation
# todo: add -> man-pages man-db

.PHONY: install
install: $(PACMAN_PACKAGES) $(YAY_PACKAGES)

$(PACMAN_PACKAGES) &:
	@echo "Ensuring $(PACMAN_PACKAGES) is installed..."
	@pacman -Q $(PACMAN_PACKAGES) > /dev/null 2>&1 || { \
		echo "Installing $(PACMAN_PACKAGES)..."; \
		sudo pacman -S --noconfirm $(PACMAN_PACKAGES); \
	}

$(YAY_PACKAGES) &:
	@echo "Ensuring $(YAY_PACKAGES) is installed..."
	@yay -Q $(YAY_PACKAGES) > /dev/null 2>&1 || { \
		echo "Installing $(YAY_PACKAGES)..."; \
		yay -S --noconfirm $(YAY_PACKAGES); \
	}

update-boot-conf:
	@echo "TODO: CHANGE THE timeout in /boot/loader/loader.conf TO ZERO!"
	@echo "TODO: COMMENT OUT nvidia-uvm IN /usr/lib/modules-load.d"

enable-multilib:
	@echo "TODO: YOU MUST UN-COMMENT the multilib inclusion in the /etc/pacman.conf config file!"

sync-wallpapers:
	@sudo mkdir -p /wallpapers && sudo cp $(WP_DIR)/* /wallpapers
