#!/bin/dash
cygpath -iw "$@" | xargs -d '\n' notepad2 +
