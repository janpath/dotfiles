#!/bin/zsh
## vim:ft=zsh
## reverse tabbing, useful in the prompt
## Copyright (C) 2008      by Daniel Friesel
##               2014-2015 by Jan Path <mail@jpath.de>
## License: WTFPL <http://www.wtfpl.net/txt/copying>

## CAVEAT: directory-names containing two or more consecutive spaces
## are not yet supported

typeset -A home_dirs
home_dirs=($(cut -d: -f1,6 </etc/passwd | grep -v '[^\]:/$' | sed 's/:/ /'))

function trunc_dir() {

  setopt localoptions
  setopt rc_quotes null_glob

  typeset -i lastfull=0
  typeset -i short=0
  typeset -i myhome=0
  typeset -i allhomes=0
  typeset -i named=0

  if zstyle -t ':prompt:rtab' fish; then
    lastfull=1
    short=1
    myhome=1
  fi
  if zstyle -t ':prompt:rtab' nameddirs; then
    myhome=1
    named=1
  fi
  zstyle -t ':prompt:rtab' last && lastfull=1
  zstyle -t ':prompt:rtab' short && short=1
  zstyle -t ':prompt:rtab' myhome && myhome=1

  while [[ $1 == -* ]]; do
    case $1 in
      -f|--fish)
        lastfull=1
        short=1
        home=1
      ;;
      --help)
        print 'Usage: rtab [-f -l -s -m -H -N] [directory]'
        print ' -f, --fish      fish-simulation, like -l -s -h -H -N'
        print ' -l, --last      Print the last directory''s full name'
        print ' -s, --short     Truncate directory names to the first character'
        print ' -m, --myhome    Substitute ~ for the home directory'
        print ' -H, --allhomes  Substitute ~user for user'\''s home directorys'
        print ' -N, --nameddirs Substitute named directories as well'
        print 'The long options can also be set via zstyle, like'
        print '  zstyle :prompt:rtab fish yes'
        return 0
      ;;
      -l|--last) lastfull=1 ;;
      -s|--short) short=1 ;;
      -m|--myhome) myhome=1 ;;
      -N|--nameddirs) named=1 ;;
      -H|--allhomes) allhomes=1 ;;
    esac
    shift
  done

  typeset -a tree expn
  typeset result part dir=${1-$PWD}
  typeset -i i

  [[ -d $dir ]] || return 0

  if (( named )) {
    named_keys_sorted=($(for key in ${(k)nameddirs}; do
      echo "$(wc -c <<< "${nameddirs[$key]}") $(wc -c <<< "$key") $key"
    done | sort -nr | sed 's/^[0-9]* [0-9]* //'))

    for part in $named_keys_sorted; {
      [[ $dir == ${nameddirs[$part]}(/*|) ]] && dir=${dir/${nameddirs[$part]}/\~$part}
    }
  }
  (( myhome )) && dir=${dir/$HOME/\~}
  if (( allhomes )) {
    for part in ${(k)home_dirs}; {
      [[ $dir == ${home_dirs[$part]}(/*|) ]] && dir=${dir/${home_dirs[$part]}/\~$part}
    }
  }

  tree=(${(s:/:)dir})
  (
    unfunction chpwd 2> /dev/null
    if [[ $tree[1] == \~* ]] {
      cd ${~tree[1]}
      result=$tree[1]
      shift tree
    } else {
      cd /
    }
    for dir in $tree; {
      if (( lastfull && $#tree == 1 )) {
        result+="/$tree"
        break
      }
      expn=(a b)
      part=''
      i=0
      until [[ (( ${#expn} == 1 )) || $dir = $expn || $i -gt 99 ]]  do
        (( i++ ))
        part+=$dir[$i]
        expn=($(echo ${part}*(-/)))
        (( short )) && break
      done
      result+="/$part"
      cd $dir
      shift tree
    }
    echo ${result:-/}
  )
}
