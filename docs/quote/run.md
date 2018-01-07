run
-------------------------------------------------------------------------
> The --quote option enables automatic quoting of arguments with embedded
> whitespace, double quotes or backslashes for consumption by the standard
> Microsoft startup code or compatible implementations. If you do not use this
> option, run assumes that the arguments are already correctly quoted for the
> consumer and simply concatenates them separated by single spaces.

http://sourceware.org/git/gitweb.cgi?p=cygwin-apps/run.git;a=blob;f=src/run.1.in

~~~sh
$ run -quote bash -c 'echo hello > hello.txt'
# good

$ run bash -c 'echo hello > hello.txt'
# bad
~~~
