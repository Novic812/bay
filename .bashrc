# define variables and functions
HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=10000
HOST=x86_64-w64-mingw32
PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw
PROMPT_COMMAND=pc
export CYGWIN=nodosfilewarning
export EDITOR='cygstart -w'
_PATH=(
  /usr/local/bin            # ffmpeg php
  /usr/bin                  # find php
  /srv/a                    #
  /srv/a/scripts            #
)
IFS=: read PATH <<< "${_PATH[*]}:$PATH"
unset _PATH

c () {
  printf '\ec'
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

setup () {
  IFS=, read <<< "$*"
  setup-x86_64 -nqP $REPLY
}

tar () {
  local bf so
  so=${*: -1}
  case $(file "$so" | awk '$0=$2') in
  XZ) bf=$(xz -lv "$so" |
    awk 'NR==11 {$6/=50688; print $6%1 ? int($6)+1 : $6}') ;;
  gzip) bf=$(gzip -l "$so" |
    awk 'NR==2 {$2/=50688; print $2%1 ? int($2)+1 : $2}') ;;
  directory) bf=$(find "$so" -type f | xargs du -B512 --apparent-size |
    awk '{bk += $1+1} END {bk/=100; print bk%1 ? int(bk)+1 : bk}') ;;
  esac
  command tar "$@" --blocking-factor=$bf \
    --checkpoint-action='ttyout=%u%\r' --checkpoint=1
}

wget () {
  if type -f wget &>/dev/null
  then
    command wget "$@"
    return
  fi
  powershell '&{
  $0 = $args[0]
  (new-object system.net.webclient).downloadfile($0, $0 -replace ".+/")
  }' $1
}
