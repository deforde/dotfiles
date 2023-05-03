export EDITOR="nvim"
export VISUAL="nvim"

export TTS_UNITY_DIR="$HOME/dev/3rdparty/Unity/"

export PATH=$PATH:$HOME/dev/3rdparty/ziglang/zig:$HOME/dev/3rdparty/zk:/usr/local/go/bin

export ZK_NOTEBOOK_DIR=$HOME/dev/deforde/notes

export DOCKER_BUILDKIT=1

export ZDOTDIR="$HOME"
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=200000
export SAVEHIST=200000

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
# antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
# antigen theme robbyrussell
# antigen theme spaceship-prompt/spaceship-prompt
antigen apply

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585858"

# SPACESHIP_VI_MODE_SHOW=false
# SPACESHIP_PROMPT_ADD_NEWLINE=false
# SPACESHIP_PROMPT_PREFIXES_SHOW=false

# SPACESHIP_PROMPT_SEPARATE_LINE=false
# SPACESHIP_CHAR_PREFIX=" "
# SPACESHIP_CHAR_SUFFIX=" "
# SPACESHIP_CHAR_SYMBOL=";"

export PROMPT='%(?.%F{blue};.%F{red};)%f '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias python='python3'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gn='/usr/bin/git --git-dir=$ZK_NOTEBOOK_DIR/.git/ --work-tree=$ZK_NOTEBOOK_DIR'

bindkey -v
bindkey -s '^u' 'tmenu^M'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
