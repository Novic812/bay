# History
HISTCONTROL='ignoredups'
PROMPT_COMMAND='history -a'

# PATH
PATH="/usr/bin"
PATH+=":/usr/local/bin"
PATH+=":/c/home/GitHub/etc"
PATH+=":/c/php"
PATH+=":$(cygpath -S)" # notepad.exe

# Functions; need to export so that scripts can use them
clear(){
    printf '\ec'
}
notepad(){
  cygpath -m "$1" | xargs notepad
}
export -f clear notepad

# CYGWIN; needs to be first
export CYGWIN='nodosfilewarning'

# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

# Load dotfiles
. ~/.bash_prompt
