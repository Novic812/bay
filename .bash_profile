# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

# Load dotfiles
for file in ~/.{bash_prompt,exports,functions,path}; do . $file; done
unset file
