[ -f ~/.browser ] && . ~/.browser
[ -f ~/.editor ] && . ~/.editor
[ "$BASH" ] && shopt -s completion_strip_exe
HISTCONTROL=ignoredups
HISTIGNORE='c:ahist *'
HISTTIMEFORMAT='%x %r '
PATH=/usr/local/bin:/usr/bin
PROMPT_COMMAND=gsh
TERM=cygwin-readline
export CYGWIN=winsymlinks:native
export LANG=en_US.UTF-8 # case insensitive sort
export PAGER='env TERM=cygwin-less less'
export POSIXLY_CORRECT # man7.org/linux/man-pages/man1/getopt.1.html
alias acc='x86_64-w64-mingw32-gcc -Wall -Wextra -Wconversion -pedantic -std=c11'
alias agit='git --no-pager'
alias agrep='grep -I --color --exclude .bash_history --exclude-dir .git'
alias ahist='history | grep -i --color'
alias alynx='lynx -dump -listonly -nonumbers'
alias aman='man -K'
alias aod='od -tcx1'
alias area='readlink -e'
alias atar='tar --checkpoint-action "ttyout=%T \r"'
alias atit='printf "\33];%s\a"'
stty -ixon

c() {
  printf '\33c'
}

gsh() {
  history -a
  if [ "$GSH" != "$PWD" ]
  then
    GSH=$PWD
  elif [ / -ot .git/HEAD ]
  then
    touch /
  else
    return
  fi
  # we do not need "\[" and "\]" here, but if we had a oneline
  # prompt with color text, it would break on Ctrl + R, Esc
  # also "033" is needed with PS1
  if [ -f .git/index ] || [ -f .git ]
  then
    local gnr=$(git name-rev --name-only @)
    PS1='\n\033[33m\w \033[36m'"$gnr"'\033[m\n$ '
  else
    PS1='\n\033[33m\w\033[m\n$ '
  fi
}

nffprobe() {
  ffprobe -hide_banner "$@" 2>&1 |
  awk '$1 == "Stream" {$0 = "\33[1;33m" $0 "\33[m"} 1'
}
