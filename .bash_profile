# History
HISTCONTROL='ignoredups'
PROMPT_COMMAND='history -a'

# PATH
PATH="/usr/bin"
PATH+=":/usr/local/bin"
PATH+=":/c/home/GitHub/etc"
PATH+=":/c/php"
PATH+=":$(cygpath -S)" # notepad.exe

# CYGWIN; needs to be first
export CYGWIN='nodosfilewarning'

# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

# Load dotfiles
. ~/.bash_prompt
. ~/.functions
