HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=
PATH=/usr/local/bin:/usr/bin:$PATH # schtasks
PROMPT_COMMAND=nr
export CYGWIN=winsymlinks:native
export EDITOR='cygstart -w'
export LANG=en_US.utf8 # case insensitive sort

c() {
  printf '\33c'
}

ish() {
  if [ -v j[*] ]
  then
    unset j
    . ~/.bashrc
  else
    PS1='${j[*]+${j[\#]-=> $?\n\n}}${j[\#]=}$ '
  fi
}

length() {
  awk '
  {
    a = 1
    while (b[a][length]) a++
    b[a][length] = $0
  }
  END {
    for (c in b[1]) {
      a = 1
      while (b[a][c]) {
        print b[a][c]
        a++
      }
    }
  }
  '
}

nr() {
  history -a
  if [ "$OLDPWD" ]
  then
    if [ . -ot "$OLDPWD" ]
    then touch .
    elif [ / -ot .git/HEAD ]
    then touch /
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
    local ec=`git name-rev --name-only @`
    PS1="\033];\s\a\n\033[33m\w \033[36m$ec\033[m\n$ "
  else PS1='\033];\s\a\n\033[33m\w\033[m\n$ '
  fi
}
