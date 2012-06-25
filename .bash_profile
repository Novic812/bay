# Load dotfiles
#for file in ~/.{bash_prompt,exports,aliases,functions,extra}; do
#  [ -r "$file" ] && source "$file"
#done

# History
HISTCONTROL='ignoredups'
PROMPT_COMMAND='history -a'

# PATH
PATH="/usr/bin"
PATH+=":/usr/local/bin"
PATH+=":$HOME/bin"
PATH+=":/c/php"
PATH+=":$(cygpath -S)" # notepad.exe

# Functions; need to export so that scripts can use them
clear(){
    printf '\ec'
}
export -f clear

# CYGWIN; needs to be first
export CYGWIN='nodosfilewarning'

# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

git_ps1(){
    g=$(cat .git/HEAD 2>/dev/null) && {
        test ${#g} = 40 && g=${g:0:7} || g=${g##*/}
        printf "($g)"
    }
}

PS1='\e];Cygwin\a
\e[32m\u@\h \e[33m\w $(git_ps1)\e[m
$ '

# This is needed for .gitconfig
notepad(){
  cygpath -m "$1" | xargs notepad
}
