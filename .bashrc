# some of these variables should also go into scripts, that
# way they can apply to people not using this environment
HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=10000
HOST=x86_64-w64-mingw32
PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw
PS1="\e];\s\a\n\e[33m\w \e[36m\$(pc)\n\[\e[m\]$ "
export CYGWIN=nodosfilewarning
export EDITOR='cygpath.sh notepad2'
_PATH=(
  /usr/bin
  /usr/local/bin
  /usr/local/sbin
  /usr/local/googlecl
  /srv/a
  /srv/a/scripts
  /programfiles/7-zip
  /programfiles/imagemagick
  /programfiles/notepad2
  /windows/system32
)
IFS=: read PATH <<< "${_PATH[*]}"
unset _PATH

c () {
  printf '\ec'
}

pc () {
  history -a
  [ -d .git ] || exit
  cd .git
  read ee <HEAD
  [[ $ee < g ]] && echo ${ee::7} || echo ${ee##*/}
  [ -g config ] && exit
  git config core.filemode 0
  chmod +s config
}
