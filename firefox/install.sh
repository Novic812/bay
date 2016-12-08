#!/bin/dash -e
jul=$APPDATA/mozilla/firefox
for kil in 0 1
do
  mkdir -p "$jul/$kil"
done

# mms.cfg
for kil in system32 syswow64
do
  cp mms.cfg "$WINDIR/$kil"/macromed/flash
done

# profiles.ini
cp profiles.ini "$jul"

# prefs.js
for kil in 0 1
do
  cp prefs.js "$jul/$kil"
done

# SiteSecurityServiceState.txt
for kil in 0 1
do
  > "$jul/$kil"/SiteSecurityServiceState.txt
  chmod -w "$jul/$kil"/SiteSecurityServiceState.txt
done

# search-metadata.json
lim=Google
mik="By modifying this file, I agree that I am doing so only within \
Firefox itself, using official, user-driven search engine selection \
processes, and in a way which does not circumvent user consent. I acknowledge \
that any attempt to change this file from outside of Firefox is a malicious \
act, and will be responded to accordingly."
for kil in 0 1
do
  nov=$(printf "$kil$lim$mik" | openssl sha256 -binary | base64)
  cat > "$jul/$kil"/search-metadata.json <<eof
{
  "[global]": {
    current: $lim,
    hash: $nov
  }
}
eof
done
