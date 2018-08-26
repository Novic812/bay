cygstart
-------------------------------------------------

http://cygwin.com/ml/cygwin/2017-12/msg00251.html

strace
-----------------------------

~~~sh
$ strace -o trac.log dash -c "sed 'w sed.txt' /dev/null"
# good

$ strace -o trac.log dash -c 'sed "w sed.txt" /dev/null'
sed: couldn't open file : No such file or directory
~~~
