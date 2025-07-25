include ../Makefile

all: install-packages update-boot-conf nvim ensure-oh-my-zsh link

PACKAGES := tmux go steam lua51 luarocks base-devel cmake unzip ninja curl
# todo: add -> man-pages man-db

install-packages: $(PACKAGES)

$(PACKAGES):
	@echo "Checking if $@ is installed..."
	@pacman -Qi $@ > /dev/null 2>&1 || { \
		echo "Installing $@..."; \
		sudo pacman -S --noconfirm $@; \
	}

update-boot-conf:
	@echo "TODO: CHANGE THE timeout in /boot/loader/loader.conf TO ZERO!"
	@echo "TODO: COMMENT OUT nvidia-uvm IN /usr/lib/modules-load.d"

enable-multilib:
	@echo "TODO: YOU MUST UN-COMMENT the multilib inclusion in the /etc/pacman.conf config file!"

PACKER=~/.local/share/nvim/site/pack/packer/start/packer.nvim
$(PACKER):
	@git clone --depth 1 https://github.com/wbthomason/packer.nvim $(PACKER)

NEOVIM_SOURCE=~/neovim
$(NEOVIM_SOURCE):
	@git clone https://github.com/neovim/neovim.git $(NEOVIM_SOURCE)

nvim: $(PACKER) build-neovim-src

build-neovim-src: $(NEOVIM_SOURCE) $(PACKAGES)
	@cd ~/neovim && \
	git checkout v0.10.4 && \
	make CMAKE_BUILD_TYPE=RelWithDebInfo && \
	sudo make install;


