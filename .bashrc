EDITOR='cygstart -w'
HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=10000
HOST=x86_64-w64-mingw32
LANG=C.utf8
PATH=$(command -p awk '!$2{printf b++?":"$0:$0}' ~/path.conf)
PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw
PROMPT_COMMAND=pc

function c {
  printf '\ec'
}

function pc {
  history -a
  local hd
  if [ -d .git ]
  then
    read hd <.git/HEAD
    # FIXME http://stackoverflow.com/a/11975827
    [[ $hd =~ / ]] && hd=${hd##*/} || hd=${hd::7}
    if [ ! -g .git/config ]
    then
      git config core.filemode 0
      chmod +s .git/config
    fi
  fi
  PS1="\e];\s\a\n\e[33m\w \e[36m$hd\n\[\e[m\]$ "
}

export EDITOR LANG
