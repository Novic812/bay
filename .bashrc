HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=10000
HOST=x86_64-w64-mingw32
PATH=$(command -p awk '!$2{printf b++?":"$0:$0}' ~/path.conf)
PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw
PS1='\e];\s\a\n\e[33m\w \e[36m$(pc)\n\e[m$ '
export EDITOR='cygstart -w' LANG=C.utf8

function c {
  printf '\ec'
}

function pc {
  history -a
  if [ -d .git ]
  then
    git name-rev --name-only @
    if [ ! -g .git/config ]
    then
      git config core.filemode 0
      chmod +s .git/config
    fi
  fi
}
