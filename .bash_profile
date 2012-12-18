# Load dotfiles
for b in ~/.{exports,path,extra}
do
  . $b
done
unset b

# Turn off history expansion (!)
set +H
