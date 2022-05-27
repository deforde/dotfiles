export ZSH="/home/danielforde/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export EDITOR='neovim'
export TTS_UNITY_DIR="/home/danielforde/dev/3rdparty/Unity/"
alias python='python3.8'
alias ll='la -la'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585858"
export PATH=/home/danielforde/dev/3rdparty/zig/zig-linux-x86_64-0.10.0-dev.2148+67c4b16d6:$PATH
setxkbmap -option caps:ctrl_modifier -option grp:shifts_toggle
killall xcape &> /dev/null
xcape -t 200 -e 'Caps_Lock=Escape'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

