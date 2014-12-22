HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=10000
HOST=x86_64-w64-mingw32
PATH=$(command -p awk '!$2{printf b++?":"$0:$0}' ~/path.conf)
PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw
PROMPT_COMMAND='history -a'
PS1='\e];\s\a\n\e[33m\w \e[36m$(pc)\e[m\n$ '
export EDITOR='cygstart -w' LANG=C.utf8

function c {
  printf '\ec'
}

function ish {
  if let ${#cn[*]}
  then
    unset cn
    . ~/.bashrc
  else
    PS1='${cn[*]+${cn[\#]-=> $?\n\n}}${cn[\#]=}$ '
  fi
}

function pc {
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
