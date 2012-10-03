# PATH
read < <(cd $HOMEDRIVE; pwd)
p=(
  /opt/etc
  /usr/bin
  /usr/local/bin
  $REPLY/progra~1/7-zip
  $REPLY/windows/system32
)
IFS=: read PATH <<< "${p[*]}"

# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

# Load dotfiles
for file in ~/.{bash_prompt,exports,functions}; do . $file; done
