HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=
PATH=/usr/local/bin:/usr/bin:$PATH # schtasks
PROMPT_COMMAND=gsh
export CYGWIN=winsymlinks:native
export EDITOR='cygstart -w'
export LANG=en_US.utf8 # case insensitive sort

c() {
  printf '\33c'
}

ish() {
  if [ "${ISH[*]+1}" ]
  then
    . ~/.bashrc
  else
    unset PROMPT_COMMAND
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
  if [ "$OLDPWD" ]
  then
    if [ . -ot "$OLDPWD" ]
    then touch .
    elif [ / -ot .git/HEAD ]
    then touch /
    elif [ "${ISH[*]+1}" ]
    then unset ISH
    else return
    fi
  else OLDPWD=/
  fi
  if [ -e .git ]
  then
    if [ ! -g .git/config ]
    then
      git config core.filemode 0
      chmod +s .git/config
    fi
    local gnr=`git name-rev --name-only @`
    PS1="\033];\s\a\n\033[33m\w \033[36m$gnr\033[m\n$ "
  else PS1='\033];\s\a\n\033[33m\w\033[m\n$ '
  fi
}
