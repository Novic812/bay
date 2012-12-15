# Load dotfiles
for file in ~/.{exports,path,extra}; do . $file; done
unset file

# Turn off history expansion (!)
set +H
