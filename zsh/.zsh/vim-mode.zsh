#!/bin/zsh

bindkey -v

bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'g~' vi-oper-swap-case
bindkey -a G end-of-buffer-or-history

bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

bindkey 'ge' vi-backward-word-end
bindkey 'gE' vi-backward-blank-word-end

KEYTIMEOUT=1

vi-backward-word-end() {
  zle vi-forward-word-end
  zle vi-backward-word -n 2 && zle vi-forward-word-end
}
vi-backward-blank-word-end() {
  zle vi-forward-blank-word-end
  zle vi-backward-blank-word -n 2 && zle vi-forward-blank-word-end
}

[[ -n $DISPLAY ]] && (( $+commands[xclip] )) && {

  function cutbuffer() {
    zle .$WIDGET
    echo $CUTBUFFER | xclip
  }

  zle_cut_widgets=(
    vi-backward-delete-char
    vi-change
    vi-change-eol
    vi-change-whole-line
    vi-delete
    vi-delete-char
    vi-kill-eol
    vi-substitute
    vi-yank
    vi-yank-eol
  )
  for widget in $zle_cut_widgets
  do
    zle -N $widget cutbuffer
  done

  function putbuffer() {
    zle copy-region-as-kill "$(xclip -o)"
    zle .$WIDGET
  }

  zle_put_widgets=(
    vi-put-after
    vi-put-before
  )
  for widget in $zle_put_widgets
  do
    zle -N $widget putbuffer
  done
}
_INSERT_PROMPT="$PROMPT"
_COMMAND_PROMPT="%B%F{red}$PROMPT%f%b"
precmd() {
  PROMPT=$_INSERT_PROMPT
}
zle-keymap-select() {
  PROMPT=""
  [[ $KEYMAP = vicmd ]] && PROMPT=$_COMMAND_PROMPT || PROMPT=$_INSERT_PROMPT
  () { return $__prompt_status }
  zle reset-prompt
}
zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init
