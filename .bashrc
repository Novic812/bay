# define variables and functions
EDITOR='start //wait'
HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=10000
HOST=x86_64-w64-mingw32
PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw
PROMPT_COMMAND=pc
_PATH=(
  /mingw64/bin
  /usr/local/bin            # ffmpeg php
  /usr/bin                  # find php
  /programfiles/imagemagick # convert ffmpeg
  /programfiles/7-zip       #
  /programfiles/googlecl    #
  /programfiles/notepad2    #
  /srv/a                    #
  /srv/a/scripts            #
)
IFS=: read PATH <<< "${_PATH[*]}:$PATH"
unset _PATH

c () {
  printf '\ec'
}

pacman () {
  [[ $1 =  -S    ]] && set -- $* --needed
  [[ $1 =~ -[RS] ]] && set -- $* --noprogressbar
  command pacman $*
}

pc () {
  history -a
  local hd
  if [ -d .git ]
  then
    read hd <.git/HEAD
    [[ $hd < g ]] && hd=${hd::7} || hd=${hd##*/}
    if ! [ -g .git/config ]
    then
      git config core.filemode 0
      chmod +s .git/config
    fi
  fi
  PS1="\e];\s\a\n\e[33m\w \e[36m$hd\n\[\e[m\]$ "
}

tar () {
  local bf so
  so=${*: -1}
  case $(file "$so" | awk '{print$2}') in
  XZ) bf=$(xz -lv "$so" |
    perl -MPOSIX -ane '$.==11 && print ceil $F[5]/50688') ;;
  gzip) bf=$(gzip -l "$so" |
    perl -MPOSIX -ane '$.==2 && print ceil $F[1]/50688') ;;
  directory) bf=$(find "$so" -type f | xargs du -B512 --apparent-size |
    perl -MPOSIX -ane '$bk += $F[0]+1; END {print ceil $bk/100}') ;;
  esac
  command tar "$@" --blocking-factor=$bf \
    --checkpoint-action='ttyout=%u%\r' --checkpoint=1
}

# export variables and functions
export EDITOR
export -f pacman
cd ~+
