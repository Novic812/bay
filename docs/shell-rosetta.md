Inter-process communication
---------------------------
We can use a pipe:

~~~sh
$ cat pe.sh
pwd | {
  read q
  printf 'q: %s\n' "$q"
}

$ strace -o pe.txt dash pe.sh
q: /home/Steven
~~~

Or command substitution:

~~~sh
$ cat cs.sh
q=$(pwd)
printf 'q: %s\n' "$q"

$ strace -o cs.txt dash cs.sh
q: /home/Steven
~~~

but a temporary file is faster:

~~~sh
$ cat tf.sh
pwd > tf.txt
read q < tf.txt
printf 'q: %s\n' "$q"

$ strace -o tf.txt dash tf.sh
q: /home/Steven
~~~

Result:

~~~
$ wc -l pe.txt cs.txt tf.txt
757 pe.txt
538 cs.txt
179 tf.txt
~~~

- http://mywiki.wooledge.org/BashFAQ/027
- http://mywiki.wooledge.org/BashFAQ/085
- http://mywiki.wooledge.org/NamedPipes
- http://wikipedia.org/wiki/Inter-process_communication
