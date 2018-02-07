cygwin-readline.ti, cygwin-less.ti
-------------------------------------------------
http://cygwin.com/ml/cygwin/2018-01/msg00002.html

HISTSIZE
-----------------------------------------------------------------------
With a clean cygwin install, HISTSIZE is set at 500. So if we start the
default shell, then run the install script, then "exit", the history will get
truncated. This will not be the case if we simply close the window, but we
want a robust solution.

we cant set HISTSIZE in the script itself, as that will only change the
subshell. we could source the script rather than running it, but again we want
a robust solution. here is what we need, in order

1. set HISTSIZE in current scope
2. symlink .bash_history
3. exit

or alternatively:

A. set HISTSIZE in .profile
B. exit
C. symlink .bash_history

now number 1 is possible by cheating - we can use SETX. again this is bad
because if we ever reinstalled Windows or took .bash_history to another
computer we are screwed. letter C is interesting, but how do we do it? we can
add something like this into install.sh:

~~~sh
echo "ln -sf $PWD/.bash_history ~" >/etc/profile
~~~

but this is bad because while idempotent, we dont want the extra syscalls if
we can avoid them. we can solve this different ways:

~~~sh
echo "[ -h ~/.bash_history ] || ln -sf $PWD/.bash_history ~" >/etc/profile
~~~

~~~sh
echo "ln -sf $PWD/.bash_history ~; rm /etc/profile" >/etc/profile
~~~

2nd option is better because it is shorter, less system calls in long run, and
we were already removing /etc/profile anyway. however it creates the problem
of escaping the input. We can solve that with trusty svnpenn/stdlib:

~~~sh
awklib '
BEGIN {
  printf "ln -s %s/.bash_history ~; rm %s",
  sh_escape(ARGV[1]), ARGV[2] > ARGV[2]
}
' "$PWD" /etc/profile
~~~
