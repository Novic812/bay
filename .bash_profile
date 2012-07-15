# PATH
paths=(
  /opt/etc
  /usr/bin
  /usr/local/bin
  $(cygpath -S) # notepad.exe
)
read PATH < <(printf ":%s" "${paths[@]}" | cut -c2-)

# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

# Load dotfiles
for file in ~/.{bash_prompt,exports,functions}; do
  . "$file"
done
