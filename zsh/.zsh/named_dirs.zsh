#!/bin/zsh

# Creates zsh named directories for all symlinks under ~/sc (shortcuts)

[ -d ~/sc ] || return

. <(
  find ~/sc -type l -print0 | while read -d $'\0' file; do
    varname=`basename "$file"`
    echo "$varname='`readlink "$file"`'; : ~$varname"
  done
)
