# LANG
LANG=

# PATH
paths=(
  /opt/etc
  /usr/bin
  /usr/local/bin
  ${COMSPEC%\\*} # notepad.exe
)
read -r PATH < <(printf ":%s" "${paths[@]}" | cut -c2-)

# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

# Load dotfiles
for file in ~/.{bash_prompt,exports,functions}; do . $file; done
