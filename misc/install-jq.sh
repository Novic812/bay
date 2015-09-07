#!/bin/sh
type apt-cyg >/dev/null || exit
# automake < autoreconf
# bison < yacc < make
# diffutils < cmp < configure
# flex < make
# libtool < autoreconf
# mingw64-x86_64-gcc-core < x86_64-w64-mingw32-gcc < configure
apt-cyg install automake bison diffutils flex libtool \
  make mingw64-x86_64-gcc-core upx zip
apt-cyg install --nodeps git
# need full clone for autoreconf
git clone --single-branch git://github.com/stedolan/jq
cd jq
git fetch origin pull/939/head:939
git checkout 939
autoreconf --install
./configure --host x86_64-w64-mingw32
make --jobs 4 LDFLAGS='-s -lshlwapi'
upx -9 jq.exe
vr=$(./jq --version | sed :)
zip -9 "$vr".zip jq.exe
