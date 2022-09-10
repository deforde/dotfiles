.PHONY: *

all: general keyd fzf zig go rust python cppdbg zk fonts nvim kitty config update_nvim update_antigen

general:
	sudo apt install -y \
	software-properties-common \
	git \
	xclip \
	curl \
	fd-find \
	ripgrep \
	exuberant-ctags \
	clang-tidy \
	clang-format \
	clangd \
	bear \
	flake8 \
	ncdu \
	python3-pip \
	python3.10-venv \
	npm \
	zsh && \
	chsh -s /usr/bin/zsh

kitty:
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin && \
	ln -s $$HOME/.local/kitty.app/bin/kitty $$HOME/.local/bin/ && \
	cp $$HOME/.local/kitty.app/share/applications/kitty.desktop $$HOME/.local/share/applications/ && \
	cp $$HOME/.local/kitty.app/share/applications/kitty-open.desktop $$HOME/.local/share/applications/ && \
	sed -i "s|Icon=kitty|Icon=/home/$$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" $$HOME/.local/share/applications/kitty*.desktop && \
	sed -i "s|Exec=kitty|Exec=/home/$$USER/.local/kitty.app/bin/kitty|g" $$HOME/.local/share/applications/kitty*.desktop

nvim:
	mkdir -p $$HOME/dev/3rdparty && \
	cd $$HOME/dev/3rdparty && \
	git clone https://github.com/neovim/neovim && \
	cd neovim && \
	rm -rf build install && \
	git checkout master && \
	git pull && \
	git checkout nightly && \
	make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$$PWD/install && \
	make install && \
	sudo ln install/bin/nvim /usr/local/bin/nvim

update_nvim:
	cd $$HOME/dev/3rdparty/neovim && \
	rm -rf build install && \
	git checkout master && \
	git pull && \
	git checkout nightly && \
	make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$$PWD/install && \
	make install && \
	sudo ln -f install/bin/nvim /usr/local/bin/nvim
	date >> $$HOME/.config/nvim/build_log.txt && \
	git describe --long >> $$HOME/.config/nvim/build_log.txt && \
	echo >> $$HOME/.config/nvim/build_log.txt && \
	config add $$HOME/.config/nvim/build_log.txt && \
	config switch main && \
	config commit -m "update nvim build_log.txt" && \
	config push && config switch lifeq && config rebase main && config push -f && \
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

update_antigen:
	curl -L git.io/antigen > $$HOME/.config/zsh/antigen.zsh

zig:
	mkdir -p $$HOME/dev/3rdparty/ziglang/zig && \
	curl -L https://ziglang.org/builds/zig-linux-x86_64-0.10.0-dev.3672+cd5a9ba1f.tar.xz | \
	tar -xJ --strip-components=1 -C $$HOME/dev/3rdparty/ziglang/zig && \
	mkdir -p $$HOME/dev/3rdparty/ziglang/zls && \
	curl -L https://github.com/zigtools/zls/releases/download/0.9.0/x86_64-linux.tar.xz | \
	tar -xJ --strip-components=1 -C $$HOME/dev/3rdparty/ziglang/zls && \
	chmod +x $$HOME/dev/3rdparty/ziglang/zls/zls

go:
	curl -L https://go.dev/dl/go1.19.linux-amd64.tar.gz | \
	sudo tar -xz -C /usr/local && \
	go install github.com/nametake/golangci-lint-langserver@latest && \
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1 && \
	go install golang.org/x/tools/gopls@latest

rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
	mkdir -p $$HOME/dev/3rdparty/rust/rust-analyzer && \
	cd $$HOME/dev/3rdparty/rust/rust-analyzer && \
	curl -LO https://github.com/rust-lang/rust-analyzer/releases/download/2022-08-22/rust-analyzer-linux-x64.vsix && \
	unzip rust-analyzer-linux-x64.vsix && \
	rm rust-analyzer-linux-x64.vsix && \
	sudo ln $$HOME/dev/3rdparty/rust/rust-analyzer/extension/server/rust-analyzer /usr/bin/rust-analyzer

python:
	mkdir -p $$HOME/.virtualenvs && \
	cd $$HOME/.virtualenvs && \
	python3 -m venv debugpy && \
	. debugpy/bin/activate && \
	python3 -m pip install debugpy pytest && \
	deactivate && \
	sudo npm install -g pyright

cppdbg:
	mkdir -p $$HOME/dev/3rdparty/cppdbg/vscode-cpptools && \
	cd $$HOME/dev/3rdparty/cppdbg/vscode-cpptools && \
	curl -LO https://github.com/microsoft/vscode-cpptools/releases/download/v1.11.5/cpptools-linux.vsix && \
	unzip cpptools-linux.vsix && \
	rm cpptools-linux.vsix && \
	chmod +x extension/debugAdapters/bin/OpenDebugAD7

keyd:
	mkdir -p $$HOME/temp && \
	cd $$HOME/temp && \
	git clone git@github.com:rvaiya/keyd.git && \
	cd keyd && \
	make && \
	sudo make install && \
	sudo systemctl enable keyd && \
	sudo systemctl start keyd && \
	sudo ln $$HOME/.config/keyd/default.conf /etc/keyd/default.conf && \
	sudo systemctl restart keyd && \
	rm -rf $$HOME/temp

fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git $$HOME/.fzf && \
	cd $$HOME/.fzf && \
	./install

zk:
	git clone git@github.com:deforde/notes.git $$HOME/dev/deforde/notes && \
	mkdir -p $$HOME/dev/3rdparty/zk && \
	curl -L https://github.com/mickael-menu/zk/releases/download/v0.10.1/zk-v0.10.1-linux-amd64.tar.gz | tar -xz -C $$HOME/dev/3rdparty/zk

config:
	git clone --bare git@github.com:deforde/dotfiles.git .cfg && \
	git --git-dir=$$HOME/.cfg/ --work-tree=$$HOME pull && \
	cd .cfg && \
	git config --local status.showUntrackedFiles no

fonts:
	mkdir -p $$HOME/.local/share/fonts && \
	cd $$HOME/.local/share/fonts && \
	curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.1/UbuntuMono.zip && \
	unzip UbuntuMono.zip && \
	rm UbuntuMono.zip
