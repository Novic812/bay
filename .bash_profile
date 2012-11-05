# Load dotfiles
for file in ~/.{bash_prompt,exports,path,extra}; do . $file; done
unset file
