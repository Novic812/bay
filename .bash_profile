# PATH
paths=(
  /c/php
  /usr/bin
  /usr/local/bin
  ~/etc
  $(cygpath -S) # notepad.exe
)
read PATH < <(printf ":%s" "${paths[@]}" | cut -c2-)

# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

# Load dotfiles
. ~/.bash_prompt
. ~/.functions
. ~/.exports
