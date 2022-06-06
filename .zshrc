export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585858"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export EDITOR='neovim'
export TTS_UNITY_DIR="$HOME/dev/3rdparty/Unity/"
export PATH=$HOME/dev/3rdparty/zig/zig-linux-x86_64-0.10.0-dev.2148+67c4b16d6:$HOME/dev/3rdparty/zk:$PATH
export ZK_NOTEBOOK_DIR=$HOME/Documents/zettelkasten

alias python='python3.8'
alias ll='la -la'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

setxkbmap -option caps:ctrl_modifier -option grp:shifts_toggle
killall xcape &> /dev/null
xcape -t 200 -e 'Caps_Lock=Escape'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

