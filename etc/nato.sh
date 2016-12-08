#!/bin/dash -e
if [ "$#" != 2 ]
then
  echo 'nato.sh [# of variables] [file]'
  exit
fi
num_vars=$1
inp_file=$2
nfa_file=$(mktemp)
pat_file=$(mktemp)
cat > "$nfa_file" <<'eof'
alfa
bravo
charlie
delta
echo
foxtrot
golf
hotel
india
juliet
kilo
lima
mike
november
oscar
papa
quebec
romeo
sierra
tango
uniform
victor
whiskey
xray
yankee
zulu
eof
# length of variable name - november is longest
var_leng=1
while [ "$var_leng" -le 8 ]
do
  # starting letter
  sta_lett=1
  while [ "$sta_lett" -le 26 ]
  do
    end_lett=$((sta_lett + num_vars - 1))
    if [ "$end_lett" -gt 26 ]
    then
      continue
    fi
    awk '
    BEGIN {ARGC = 2}
    NR == ARGV[2], NR == ARGV[3] {
      if (length < ARGV[4]) exit 1
      print substr($0, 1, ARGV[4])
    }
    ' "$nfa_file" "$sta_lett" "$end_lett" "$var_leng" > "$pat_file"
    if [ "$?" = 1 ]
    then
      continue
    fi
    awk '{printf $0 FS}' "$pat_file"
    if grep -qif "$pat_file" "$inp_file"
    then
      echo BAD
    else
      echo GOOD
      exit
    fi
    : $((sta_lett += 1))
  done
  : $((var_leng += 1))
done
