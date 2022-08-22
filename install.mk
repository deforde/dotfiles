.PHONY: *

all: general kitty nvim debugpy keyd fzf config

general:
	sudo apt install -y \
	git \
	xclip \
	curl \
	fd-find \
	ripgrep \
	ctags \
	rust-analyzer \
	flake8 \
	ncdu \
	python3-pip \
	python3.10-venv \
	zsh && \
	chsh -s ($$which zsh)

kitty:
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin && \
	ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/ && \
	cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/ && \
	cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/ && \
	sed -i "s|Icon=kitty|Icon=/home/$$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop && \
	sed -i "s|Exec=kitty|Exec=/home/$$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

nvim:
	sudo add-apt-repository ppa:neovim-ppa/unstable && \
	sudo apt install neovim

debugpy:
	mkdir -p $$HOME/.virtualenvs && \
	cd $$HOME/.virtualenvs && \
	python -m venv debugpy && \
	source debugpy/bin/activate && \
	python -m pip install debugpy pytest && \
	deactivate

keyd:
	mkdir -p $$HOME/temp && \
	cd $$HOME/temp && \
	git clone git@github.com:rvaiya/keyd.git && \
	make && \
	sudo make install && \
	sudo systemctl enable keyd && \
	sudo systemctl start keyd && \
	sudo ln $$HOME/.config/keyd/default.conf /etc/keyd/default.conf && \
	sudo systemctl restart keyd

fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git $$HOME/.fzf && \
	cd $$HOME/.fzf && \
	./install

config:
	git clone --bare git@github.com:deforde/dotfiles.git .cfg && \
	git --git-dir=$$HOME/.cfg/ --work-tree=$$HOME pull
