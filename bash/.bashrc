HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=
PATH=/usr/local/bin:/usr/bin
PROMPT_COMMAND='history -a'
PS1='\033];\s\a\n\033[33m\w \033[36m$(nr)\033[m\n$ '
export CYGWIN=winsymlinks:native
export EDITOR='cygstart -w'
export LANG=en_US.utf8 # case insensitive sort

c() {
  printf '\33c'
}

ish() {
  if [ -v cn[*] ]
  then
    unset cn
    . ~/.bashrc
  else
    PS1='${cn[*]+${cn[\#]-=> $?\n\n}}${cn[\#]=}$ '
  fi
}

length() {
  awk '
  {
    foo[$0] = length
  }
  END {
    PROCINFO["sorted_in"] = "@val_num_asc"
    for (bar in foo) print bar
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
