.ONESHELL:
.PHONY: *

all: general keyd fzf zig go rust python cppdbg zk fonts nvim kitty config update_nvim update_antigen nix luajit

general:
	sudo apt install -y \
	bear \
	clang-format \
	clang-tidy \
	clangd \
	cmake \
	curl \
	exuberant-ctags \
	fd-find \
	flake8 \
	gettext \
	git \
	ncdu \
	npm \
	patchelf \
	python3-pip \
	python3.10-venv \
	ripgrep \
	shellcheck \
	software-properties-common \
	zsh
	chsh -s /usr/bin/zsh

kitty:
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
	ln -f -s $$HOME/.local/kitty.app/bin/kitty $$HOME/.local/bin/
	cp $$HOME/.local/kitty.app/share/applications/kitty.desktop $$HOME/.local/share/applications/
	cp $$HOME/.local/kitty.app/share/applications/kitty-open.desktop $$HOME/.local/share/applications/
	sed -i "s|Icon=kitty|Icon=/home/$$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" $$HOME/.local/share/applications/kitty*.desktop
	sed -i "s|Exec=kitty|Exec=/home/$$USER/.local/kitty.app/bin/kitty|g" $$HOME/.local/share/applications/kitty*.desktop

nvim:
	mkdir -p $$HOME/dev/3rdparty
	cd $$HOME/dev/3rdparty
	git clone https://github.com/neovim/neovim
	cd neovim
	rm -rf build install
	git checkout master
	git pull
	git fetch -t -f
	git checkout nightly
	make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$$PWD/install
	make install
	sudo ln -f install/bin/nvim /usr/local/bin/nvim

update_nvim:
	cd $$HOME/dev/3rdparty/neovim
	rm -rf build install
	git checkout master
	git pull
	git fetch -t -f
	git checkout nightly
	make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$$PWD/install
	make install
	date >> $$HOME/.config/nvim/build_log.txt
	git describe --long >> $$HOME/.config/nvim/build_log.txt
	echo >> $$HOME/.config/nvim/build_log.txt
	git --git-dir=$$HOME/.cfg/ --work-tree=$$HOME add $$HOME/.config/nvim/build_log.txt
	git --git-dir=$$HOME/.cfg/ --work-tree=$$HOME switch main
	git --git-dir=$$HOME/.cfg/ --work-tree=$$HOME commit -m "update nvim build_log.txt"
	git --git-dir=$$HOME/.cfg/ --work-tree=$$HOME push --set-upstream origin main
	sudo ln -f install/bin/nvim /usr/local/bin/nvim
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

update_antigen:
	curl -L git.io/antigen > $$HOME/.config/zsh/antigen.zsh
	git --git-dir=$$HOME/.cfg/ --work-tree=$$HOME add $$HOME/.config/zsh/antigen.zsh
	git --git-dir=$$HOME/.cfg/ --work-tree=$$HOME switch main
	git --git-dir=$$HOME/.cfg/ --work-tree=$$HOME commit -m "update antigen.zsh"
	git --git-dir=$$HOME/.cfg/ --work-tree=$$HOME push --set-upstream origin main

zig:
	mkdir -p $$HOME/dev/3rdparty/ziglang/zig
	curl -L https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.2375+771d07268.tar.xz | \
	tar -xJ --strip-components=1 -C $$HOME/dev/3rdparty/ziglang/zig

go:
	curl -L https://go.dev/dl/go1.19.linux-amd64.tar.gz | \
	sudo tar -xz -C /usr/local

rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

python:
	mkdir -p $$HOME/.virtualenvs
	cd $$HOME/.virtualenvs
	python3 -m venv debugpy
	. debugpy/bin/activate
	python3 -m pip install debugpy pytest
	deactivate
	sudo npm install -g pyright

cppdbg:
	mkdir -p $$HOME/dev/3rdparty/cppdbg/vscode-cpptools
	cd $$HOME/dev/3rdparty/cppdbg/vscode-cpptools
	curl -LO https://github.com/microsoft/vscode-cpptools/releases/download/v1.11.5/cpptools-linux.vsix
	unzip cpptools-linux.vsix
	rm cpptools-linux.vsix
	chmod +x extension/debugAdapters/bin/OpenDebugAD7

keyd:
	mkdir -p $$HOME/temp
	cd $$HOME/temp
	git clone git@github.com:rvaiya/keyd.git
	cd keyd
	make
	sudo make install
	sudo systemctl enable keyd
	sudo systemctl start keyd
	sudo ln $$HOME/.config/keyd/default.conf /etc/keyd/default.conf
	sudo systemctl restart keyd
	rm -rf $$HOME/temp

fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git $$HOME/.fzf
	cd $$HOME/.fzf
	./install

zk:
	git clone git@github.com:deforde/notes.git $$HOME/dev/deforde/notes
	mkdir -p $$HOME/dev/3rdparty/zk
	curl -L https://github.com/mickael-menu/zk/releases/download/v0.10.1/zk-v0.10.1-linux-amd64.tar.gz | tar -xz -C $$HOME/dev/3rdparty/zk
	cd $$HOME/dev/deforde/notes
	$$HOME/dev/3rdparty/zk/zk init

config:
	git clone --bare git@github.com:deforde/dotfiles.git .cfg
	git --git-dir=$$HOME/.cfg/ --work-tree=$$HOME pull
	cd .cfg
	git config --local status.showUntrackedFiles no

fonts:
	mkdir -p $$HOME/.local/share/fonts
	cd $$HOME/.local/share/fonts
	curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.1/UbuntuMono.zip
	unzip UbuntuMono.zip
	rm UbuntuMono.zip

nix:
	sh <(curl -L https://nixos.org/nix/install) --daemon

kotlin:
	sudo apt install -y gradle

luajit:
	mkdir -p $$HOME/dev/3rdpart/luajit
	curl -L https://luajit.org/download/LuaJIT-2.0.5.tar.gz | \
	tar -xz -C $$HOME/dev/3rdpart/luajit
	make -C $$HOME/dev/3rdpart/luajit/LuaJIT-2.0.5 && \
	sudo make -C $$HOME/dev/3rdpart/luajit/LuaJIT-2.0.5 install

netcoredbg:
	rm -rf $$HOME/.local/share/nvim/netcoredbg
	curl -L https://github.com/Samsung/netcoredbg/releases/download/2.0.0-895/netcoredbg-linux-amd64.tar.gz | \
	tar -xz -C $$HOME/.local/share/nvim
