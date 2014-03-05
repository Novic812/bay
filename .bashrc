# define variables and functions
CYGWIN=nodosfilewarning
EDITOR='cygstart -w'
HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=10000
HOST=x86_64-w64-mingw32
PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw
PROMPT_COMMAND=pc
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

command_not_found_handle () {
  lk='cygwin.com/cgi-bin2/package-grep.cgi?text=1&arch=x86_64&grep='
  curl -s "$lk$1(\.exe)?$" | awk '
  $2 && !pk[$2]++ {
    print "apt-cyg install", $2
  }
  ' FS=/
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
  $0 = [uri]$args[0]
  if (!$0.host) {$0 = [uri]"http://$0"}
  $1 = $0.segments[-1]
  if (test-path $1 -patht c) {$1 = "$1~"}
  (new-object net.webclient).downloadfile($0, $1)
  }' ${*: -1}
}

# export variables and functions
export CYGWIN EDITOR
export -f wget
