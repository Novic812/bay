[ -f ~/.browser ] && . ~/.browser
[ -f ~/.editor ] && . ~/.editor
[ "$BASH" ] && shopt -s completion_strip_exe
HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=
PATH=/usr/local/bin:/usr/bin
PROMPT_COMMAND=gsh
TERM=cygwin-vb
export CYGWIN=winsymlinks:native
export LANG=en_US.UTF-8 # case insensitive sort
export POSIXLY_CORRECT # man7.org/linux/man-pages/man1/getopt.1.html
alias acc='x86_64-w64-mingw32-gcc -Wall -Wextra -Wconversion -pedantic -std=c11'
alias agit='git --no-pager'
alias agrep='grep -I --color --exclude .bash_history --exclude-dir .git'
alias aod='od -tcx1'
alias atar='tar --checkpoint-action "ttyout=%T \r"'
stty -ixon

c() {
  printf '\33c'
}

ish() {
  if [ "${ISH[*]+1}" ]
  then
    PROMPT_COMMAND=gsh
  else
    PROMPT_COMMAND='history -a'
    PS1='${ISH[*]+${ISH[\#]-=> $?\n\n}}${ISH[\#]=}$ '
  fi
}

gsh() {
  history -a
  if [ "$GSH" != "$PWD" ]
  then GSH=$PWD
  elif [ / -ot .git/HEAD ]
  then touch /
  elif [ "${ISH[*]+1}" ]
  then unset ISH
  else return
  fi
  # we do not need "\[" and "\]" here, but if we had a oneline
  # prompt with color text, it would break on Ctrl + R, Esc
  if [ -f .git/index ] || [ -f .git ]
  then
    local gnr=$(git name-rev --name-only @)
    PS1='\033];\s\a\n\033[33m\w \033[36m'"$gnr"'\033[m\n$ '
  else PS1='\033];\s\a\n\033[33m\w\033[m\n$ '
  fi
}

nffmpeg() {
  ffmpeg -hide_banner "$@" 2>&1 |
  awk '$1 == "Stream" {$0 = "\33[1;33m" $0 "\33[m"} 1'
}

nffprobe() {
  ffprobe -hide_banner "$@" 2>&1 |
  awk '$1 == "Stream" {$0 = "\33[1;33m" $0 "\33[m"} 1'
}

nwget() {
  wget "$@" 2>&1 | awk '/HTTPS|Location/ {$0 = "\33[1;33m" $0 "\33[m"} 1'
}
