## If not running interactively, do not do anything
[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux || true

COMPLETION_WAITING_DOTS='false'
source ~/.zsh/completion.zsh

autoload -Uz compinit
compinit

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

unsetopt beep

source ~/.zsh/termsupport.zsh

PROMPT='%# '
#RPROMPT='%F{red}%B%(?..[%?] )%b%f%~ < %F{cyan}%n%f@%F{blue}%U%m%u%f'

#Fish-shell
setopt PROMPT_SUBST
source ~/.zsh/trunc_dir.zsh
RPROMPT='%F{red}%B%(?..[%?] )%b%f%F{cyan}%n%f@%F{blue}%U%M%u%f:$(trunc_dir -l -N -m -H)'

#Named Directorys
tmp=~/.tmp
school=~/Documents/school
ws=~/Documents/workspace
qlrepo=~ws/quodlibet
soli=/srv/http/wordpress/wp-content/themes/soliloquy-pro/
uni=~/Documents/university/2016ss
: ~tmp ~school ~ws ~soli ~qlrepo ~uni

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus

source ~/.zsh/vim-mode.zsh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

alias grep='grep --color=auto'
alias ls='ls --color=auto'

alias refresh='source ~/.zshrc'

alias sicprepl='racket -i -p neil/sicp -l xrepl'

source ~/.profile

source ~/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source ~/.zsh/history-substring-search/zsh-history-substring-search.zsh
#source ~/.zsh/autosuggestions/autosuggestions.zsh
#zle-line-init() {
#  zle autosuggest-start
#}
#zle -N zle-line-init
#bindkey '^T' autosuggest-toggle
#bindkey '^F' vi-forward-word
