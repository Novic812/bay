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
  {
    alf = 1
    while (bra[alf][length]) alf++
    bra[alf][length] = $0
  }
  END {
    for (cha in bra[1]) {
      alf = 1
      while (bra[alf][cha]) {
        print bra[alf][cha]
        alf++
      }
    }
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

wed() {
  notepad2 "$(cygpath -w "$1")"
}
