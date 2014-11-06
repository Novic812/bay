# define variables and functions
EDITOR='cygstart -w'
HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=10000
HOST=x86_64-w64-mingw32
LANG=C.utf8
PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw
PROMPT_COMMAND=pc
_PATH=(
  '/shell/bin'                               # ffmpeg 1
  '/Program Files/imagemagick'               # ffmpeg 2
  '/Program Files/kid3'
  '/Repos/a'
  '/Repos/a/misc'
  '/Repos/apt-cyg'
  '/usr/local/bin'                           # wish 1
  '/usr/bin'                                 # wish 2 sort 1
  '/Windows/system32'                        #        sort 2
)
IFS=: read PATH <<< "${_PATH[*]}"
unset _PATH

function c {
  printf '\ec'
}

function pc {
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

function tar {
  local ce so
  so=${*: -1}
  ce='ROUNDMODE=u OFMT=%.0f'
  case $(file "$so" | awk '$0=$2') in
  XZ)
    xz -lv "$so" | awk -M 'NR==11 {print $6/50688}' $ce
  ;;
  gzip)
    gzip -l "$so" | awk -M 'NR==2 {print $2/50688}' $ce
  ;;
  directory)
    find "$so" -type f | xargs du -B512 --apparent-size |
    awk -M '{bk += $1+1} END {print bk/100}' $ce
  ;;
  esac >/tmp/bf
  command tar "$@" --blocking-factor=$(</tmp/bf) \
    --checkpoint-action='ttyout=%u%\r' --checkpoint=1
}

function wget {
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

export EDITOR LANG
export -f wget
