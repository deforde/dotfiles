export EDITOR="nvim"
export VISUAL="nvim"

export TTS_UNITY_DIR="$HOME/dev/3rdparty/Unity/"

export PATH=$HOME/dev/3rdparty/ziglang/zig:$HOME/dev/3rdparty/zk:$HOME/dev/3rdparty/ziglang/zls:/usr/local/go/bin:$PATH
# $HOME/dev/3rdparty/kotlin-language-server/server/bin

export ZK_NOTEBOOK_DIR=$HOME/dev/deforde/notes

export DOCKER_BUILDKIT=1

export ZDOTDIR="$HOME"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

autoload -U compinit && compinit
setopt complete_in_word
setopt auto_menu
setopt autocd
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&'

setopt append_history
# setopt bang_hist
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
# setopt inc_append_history
setopt share_history

typeset -U path

source "$HOME/.config/zsh/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
# antigen theme robbyrussell
antigen theme spaceship-prompt/spaceship-prompt
antigen apply

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585858"

SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias python='python3'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gn='/usr/bin/git --git-dir=$ZK_NOTEBOOK_DIR/.git/ --work-tree=$ZK_NOTEBOOK_DIR'

bindkey -v
