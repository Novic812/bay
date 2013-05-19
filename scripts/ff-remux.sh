# ffmpeg remux to format of choice

warn ()
{
  printf '\e[36m%s\e[m\n' "$*"
}

log ()
{
  unset PS4
  qq=$((set -x; : "$@") 2>&1)
  warn "${qq:2}"
  eval "${qq:2}"
}

unquote ()
{
  read -r $1 <<< "${!1//\"}"
}

usage ()
{
  echo usage: $0 FORMAT
  echo
  echo this will not delete original file
  exit
}

[ $1 ] || usage
arg_fmt=$1
flac=nocopy
wav=nocopy

if ! [ ${!arg_fmt} ]
then
  cpy='-c copy'
fi

printf -v nwn '\n'
while read -rp "Drag file here, or use a pipe.$nwn" inf
do
  [[ $inf ]] || exit
  unquote inf
  otf=${inf%.*}.${arg_fmt}
  log ffmpeg -i "$inf" -v error -stats -nostdin $cpy "$otf"
  echo
done
