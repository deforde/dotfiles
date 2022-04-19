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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
