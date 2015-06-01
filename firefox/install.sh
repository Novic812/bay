#!/bin/sh
set "$APPDATA"/mozilla/firefox
mkdir -p "$1"/{0,1}

# profiles.ini
cp profiles.ini "$1"

# prefs.js
for each in "$1"/{0,1}
do
  cp prefs.js "$each"
done

# search-metadata.json
if ! type jq >/dev/null
then
  exit
fi
z=Google
y="By modifying this file, I agree that I am doing so only within \
Firefox itself, using official, user-driven search engine selection \
processes, and in a way which does not circumvent user consent. I acknowledge \
that any attempt to change this file from outside of Firefox is a malicious \
act, and will be responded to accordingly."
for x in 0 1
do
  w=$(printf "$x$z$y" | openssl sha256 -binary | base64)
  jq -n --arg z "$z" --arg w "$w" '
  {
    "[global]": {
      current: $z,
      hash: $w
    }
  }
  ' > "$1/$x"/search-metadata.json
done
