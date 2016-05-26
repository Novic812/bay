HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=
PATH=/usr/local/bin:/usr/bin:$PATH # schtasks
PROMPT_COMMAND='history -a'
PS1='\033];\s\a\n\033[33m\w \033[36m$(nr)\033[m\n$ '
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
  if [ -d .git ]
  then
    if [ -e /bin/git ]
    then
      git symbolic-ref -q --short HEAD || git name-rev --name-only HEAD
      if [ ! -g .git/config ]
      then
        git config core.filemode 0
        chmod +s .git/config
      fi
    fi
  fi
}
