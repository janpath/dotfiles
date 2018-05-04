## If not running interactively, do not do anything
[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux || true

fpath=( ~/.zsh/zfuncs "${fpath[@]}" )

COMPLETION_WAITING_DOTS='false'
. ~/.zsh/completion.zsh

autoload -Uz compinit
compinit

autoload -Uz manydots-magic
manydots-magic

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
setopt autocd

unsetopt beep

. ~/.zsh/termsupport.zsh

PROMPT='%# '
RPROMPT='%F{red}%B%(?..[%?] )%b%f%~ < %F{cyan}%n%f@%F{blue}%U%m%u%f'

. ~/.named_dirs

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus

. ~/.zsh/vim-mode.zsh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Common aliases
alias grep='grep --color=auto'
alias ls='ls -Fh --color=auto'
alias l='ls'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'
alias t='tree'
alias tp='tree --prune -P'
alias refresh='. ~/.zshrc'
alias info='info --vi-keys --variable link-style=blue --variable active-link-style=blue,underline --variable match-style=bold'
alias r='rm'
alias rr='rm -rf'

. ~/.aliases

. /etc/profile.d/vte.sh

. ~/.profile

. ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
. ~/.zsh/history-substring-search/zsh-history-substring-search.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
