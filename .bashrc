HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=
PATH=$(command -p awk '!$2{printf b++?":"$0:$0}' ~/path.conf)
PROMPT_COMMAND='history -a'
PS1='\e];\s\a\n\e[33m\w \e[36m$(nr)\e[m\n$ '
export EDITOR='cygstart -w'
export LANG=en_US.utf8 # case insensitive sort

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

function length {
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

function nr {
  if [ -d .git ]
  then
    if type git &>/dev/null
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
