## If not running interactively, do not do anything
[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux || true

# The xterm-termite terminal type only makes problems, because it usually is not
# understood.
if [ "x$TERM" = "xxterm-termite" ]; then
  export TERM="xterm-256color"
fi

fpath=( ~/.zsh/zfuncs "${fpath[@]}" )

COMPLETION_WAITING_DOTS='false'
. ~/.zsh/completion.zsh
. ~/.zsh/nix-zsh-completions/nix.plugin.zsh
fpath=($HOME/.zsh/nix-zsh-completions $fpath)

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

[ -z $IN_NIX_SHELL ] && PROMPT='%# ' || PROMPT='%F{blue}%BNix%b%f %# '
RPROMPT='%F{red}%B%(?..[%?] )%b%f%~ %F{cyan}%n%f@%F{blue}%U%m%u%f'

. ~/.zsh/named_dirs.zsh

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus

. ~/.zsh/vim-mode.zsh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Common aliases
alias grep='grep --color=auto'
alias ls='ls -vFh --color=auto'
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

. ~/.zsh/zsh-nix-shell/nix-shell.plugin.zsh
. ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
. ~/.zsh/history-substring-search/zsh-history-substring-search.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
