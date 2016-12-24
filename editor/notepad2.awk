#!/usr/bin/awk -f
function br(ch, de) {
  ec = "\47"; go = split(ch, ju, ec); for (ki in ju) {
    de = de (ju[ki] ~ /[^[:alnum:]%+,./:=@_-]/ ? ec ju[ki] ec : ju[ki])
    if (ki < go) de = de "\\" ec
  } return de
}
BEGIN {
  "cygpath -iw " br(ARGV[1]) | getline
  system("Notepad2 " br($0))
}
