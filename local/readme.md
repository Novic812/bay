`echo` is not portable:

~~~sh
$ bash -c 'echo "1234\c5678"'
1234\c5678

$ dash -c 'echo "1234\c5678"'
1234
~~~

even as a variable:

~~~sh
$ bash -c 'set "1234\c5678"; echo "$1"'
1234\c5678

$ dash -c 'set "1234\c5678"; echo "$1"'
1234
~~~
