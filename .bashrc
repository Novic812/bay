# define variables and functions
export EDITOR='cygstart -w'
HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=10000
HOST=x86_64-w64-mingw32
PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw
PROMPT_COMMAND=pc
_PATH=(
  '/shell/bin'                               # ffmpeg 1
  '/Program Files/imagemagick'               # ffmpeg 2
  '/Program Files (x86)/winamp'
  '/Repos/a'
  '/Repos/a/misc'
  '/Repos/apt-cyg'
  '/Windows/system32'
  '/usr/local/bin'                           # wish 1
  '/usr/bin'                                 # wish 2
)
IFS=: read PATH <<< "${_PATH[*]}"
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
    [[ $hd =~ / ]] && hd=${hd##*/} || hd=${hd::7}
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
  if command wget -h &>/dev/null
  then
    command wget "$@"
    return
  fi
  powershell '&{
  param([uri]$rc)
  if (!$rc.host) {$rc = "http://$rc"}
  $of = $rc.segments[-1]
  if (test-path $of) {"$of already there."} else {wget $rc -outf $of}
  }' ${*: -1} >&2
}
export -f wget
