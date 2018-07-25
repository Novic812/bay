LC_ALL
-----------------------
- case insensitive sort
- http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html

POSIXLY_CORRECT
--------------------------------------------------
http://man7.org/linux/man-pages/man1/getopt.1.html

PS1
---------------------------------------------------------------------------
We do not need `\[` and `\]` currently, but if we had a oneline prompt with
color text, it would break on Ctrl + R, Esc. Also `\033` is needed

cygwin-readline.ti, cygwin-less.ti
-------------------------------------------------
http://cygwin.com/ml/cygwin/2018-01/msg00002.html
