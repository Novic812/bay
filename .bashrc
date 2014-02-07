# some of these variables should also go into scripts, that
# way they can apply to people not using this environment
HISTCONTROL=ignoredups
HISTIGNORE=c
HISTSIZE=10000
HOST=x86_64-w64-mingw32
PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw
PROMPT_COMMAND=pc
export EDITOR='start //wait'
_PATH=(
  /mingw64/bin
  /usr/local/bin    # ffmpeg php
  /usr/bin          # find php
  /opt/imagemagick  # convert ffmpeg
  /opt/7-zip        #
  /opt/googlecl     #
  /opt/notepad2     #
  /windows/system32 # convert find
  /srv/a            #
  /srv/a/scripts    #
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
    [[ $hd < g ]] && hd=${hd::7} || hd=${hd##*/}
    if ! [ -g .git/config ]
    then
      git config core.filemode 0
      chmod +s .git/config
    fi
  fi
  PS1="\e];\s\a\n\e[33m\w \e[36m$hd\n\[\e[m\]$ "
}

cd ~+
