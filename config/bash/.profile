if [ -f ~/.editor ]
then
  . ~/.editor
fi
if [ -f ~/.pager ]
then
  . ~/.pager
fi
if [ "$BASH" ]
then
  shopt -s completion_strip_exe
fi
HISTCONTROL=erasedups
HISTIGNORE='q:ahist *'
HISTSIZE=25000
HISTTIMEFORMAT='%x %r '
PATH=/usr/local/bin:/usr/bin
PROMPT_COMMAND=gsh
TERM=cygwin-readline
export BROWSER=firefox
export CYGWIN=winsymlinks:native
export LC_ALL=en_US.UTF-8
export POSIXLY_CORRECT
alias agit='git --no-pager'
alias agrep='grep -I --color --exclude-dir .git'
alias ahist='history | grep -i --color'
alias als='ls -A -g -o'
alias aman='man -K -w'
alias apr='pr -d -t'
alias area='realpath -m'
alias q='tput reset'
stty -ixon

gsh() {
  history -w
  if [ "$GSH" != "$PWD" ]
  then
    GSH=$PWD
  elif [ / -ot .git/HEAD ]
  then
    touch /
  else
    return
  fi
  if [ -f .git/index ] || [ -f .git ]
  then
    local gnr=$(git name-rev --name-only @)
    PS1='\n\033[33m\w \033[36m'"$gnr"'\033[m\n$ '
  else
    PS1='\n\033[33m\w\033[m\n$ '
  fi
}

ncurl() {
  curl -I -L "$@" | awk '
  {
    q = tolower($1)
    if (q ~ /content-disposition|content-length|last-modified|location/) {
      $1 = "\33[1;32m" $1 "\33[m"
    }
    else if ($1 ~ /:/) {
      $1 = "\33[1;33m" $1 "\33[m"
    }
  }
  1
  '
}

nffprobe() {
  ffprobe -hide_banner "$@" 2>&1 |
  awk '$1 == "Stream" {$0 = "\33[1;33m" $0 "\33[m"} 1'
}

nfind() {
  find '(' -xtype l -o -type d -empty ')' -delete -print
}

nod() {
  od -An -tcx1 -w19 | awk 'NR % 2 {$0 = "\33[1;32m" $0 "\33[m"} 1'
}

ntar() {
  tar --checkpoint-action 'ttyout=%T \r' "$@"
}

xs() {
  z=$?
  if [ "$z" = 0 ]
  then
    printf '\33[1;32m%d SUCCESS\33[m\n' "$z"
  else
    printf '\33[1;31m%d FAILURE\33[m\n' "$z"
  fi
}
