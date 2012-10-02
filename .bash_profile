# PATH

realpath(){
  read $1 < <(cd ${!1}; pwd)
}

realpath HOMEDRIVE
p=(
  /opt/etc
  /usr/bin
  /usr/local/bin
  $HOMEDRIVE/progra~1/7-zip
  $HOMEDRIVE/windows/system32
)
IFS=: read PATH <<< "${p[*]}"

# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

# Load dotfiles
for file in ~/.{bash_prompt,exports,functions}; do . $file; done
