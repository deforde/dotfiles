export EDITOR="nvim"
export VISUAL="nvim"

export TTS_UNITY_DIR="$HOME/dev/3rdparty/Unity/"

export PATH=$HOME/dev/3rdparty/zig/zig-linux-x86_64-0.10.0-dev.2624+d506275a0:$HOME/dev/3rdparty/zk:$PATH

export ZK_NOTEBOOK_DIR=$HOME/dev/deforde/notes

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

bindkey -v

source "$HOME/.config/zsh/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
# antigen theme robbyrussell
antigen theme spaceship-prompt/spaceship-prompt
antigen apply

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585858"

setxkbmap -option caps:ctrl_modifier -option grp:shifts_toggle
killall xcape &> /dev/null
xcape -t 200 -e 'Caps_Lock=Escape'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias python='python3'
alias ll='ls -la'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gn='/usr/bin/git --git-dir=$ZK_NOTEBOOK_DIR/.git/ --work-tree=$ZK_NOTEBOOK_DIR'

