EDITOR=wed
HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=
PATH=/usr/local/bin:/usr/bin:$PATH # schtasks
PROMPT_COMMAND=gsh
export BROWSER=firefox
export CYGWIN=winsymlinks:native
export GIT_EDITOR='notepad2 "$(cygpath -w "$1")" #'
export LANG=en_US.utf8 # case insensitive sort
alias agrep='grep -I --color --exclude .bash_history --exclude-dir .git'
shopt -s completion_strip_exe

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

length() {
  awk '
  {jul[NR] = $0; kil[NR] = length; lim[NR] = NR}
  END {
    for (mik in jul) {
      nov = lim[mik]; osc = mik - 1
      while (osc && kil[lim[osc]] > kil[nov]) {lim[osc+1] = lim[osc]; osc--}
      lim[osc+1] = nov
    }
    for (mik in lim) print jul[lim[mik]]
  }
  '
}

gsh() {
  history -a
  if [ "$OLDPWD" != "$PWD" ]
  then OLDPWD=$PWD
  elif [ / -ot .git/HEAD ]
  then touch /
  elif [ "${ISH[*]+1}" ]
  then unset ISH
  else return
  fi
  if [ -f .git/index -o -f .git ]
  then
    local gnr=$(git name-rev --name-only @)
    PS1="\033];\s\a\n\033[33m\w \033[36m$gnr\033[m\n$ "
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

wed() {
  notepad2 "$(cygpath -w "$1")"
}
