include ../Makefile

all: update-boot-conf steam nvim ensure-oh-my-zsh link

update-boot-conf:
	@echo "TODO: CHANGE THE timeout in /boot/loader/loader.conf TO ZERO!"
	@echo "TODO: COMMENT OUT nvidia-uvm IN /usr/lib/modules-load.d"

steam: enable-multilib
	@sudo pacman -Qi steam || sudo pacman -Syu --noconfirm steam

enable-multilib:
	@echo "TODO: YOU MUST UN-COMMENT the multilib inclusion in the /etc/pacman.conf config file!"

nvim: build-neovim-src
	@sudo pacman -Qi lua51 || sudo pacman -S --noconfirm lua51
	@sudo pacman -Qi luarocks || sudo pacman -S --noconfirm luarocks

PACKER=~/.local/share/nvim/site/pack/packer/start/packer.nvim

$(PACKER):
	@git clone --depth 1 https://github.com/wbthomason/packer.nvim 

neovim-build-deps: $(PACKER)
	@sudo pacman -Qi base-devel || sudo pacman -S --noconfirm base-devel
	@sudo pacman -Qi cmake || sudo pacman -S --noconfirm cmake
	@sudo pacman -Qi unzip || sudo pacman -S --noconfirm unzip
	@sudo pacman -Qi ninja || sudo pacman -S --noconfirm ninja
	@sudo pacman -Qi curl || sudo pacman -S --noconfirm curl

build-neovim-src: ~/neovim neovim-build-deps
	@cd ~/neovim && \
	git checkout v0.10.4 && \
	make CMAKE_BUILD_TYPE=RelWithDebInfo && \
	sudo make install;

~/neovim:
	@git clone https://github.com/neovim/neovim.git ~/neovim

