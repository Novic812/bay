# grep needs LANG=
# jekyll needs LANG=en_US.UTF-8
# So it is best to just leave it alone

# PATH
p=(
  /opt/etc
  /usr/bin
  /usr/local/bin
  $HOMEDRIVE/progra~1/7-zip
  $HOMEDRIVE/windows/system32
)
IFS=: read -r PATH <<< "${p[*]}"

# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

# Load dotfiles
for file in ~/.{aliases,bash_prompt,exports,functions}; do . $file; done
