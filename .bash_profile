# LANG
LANG=

# PATH
paths=(
  /opt/etc
  /usr/bin
  /usr/local/bin
  \\progra~1/7-zip
  \\windows/system32
)
IFS=: read -r PATH <<< "${paths[*]}"

# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

# Load dotfiles
for file in ~/.{bash_prompt,exports,functions}; do . $file; done
