#!/bin/bash

# https://superuser.com/questions/1271147/change-key-bindings-keyboard-shortcuts-in-firefox-quantum
# https://github.com/nilcons/firefox-hacks

mkdir -p /tmp/hackFF/content
cd /tmp/hackFF/content

cp /usr/lib/firefox/browser/omni.ja .

unzip omni.ja
mv omni.ja ../omni.ja_old

sed -i -- 's/reserved="true"//g' chrome/browser/content/browser/browser.xhtml

zip -r ../omni.ja ./*
cd ../

rm -r content
cp omni.ja /usr/lib/firefox/browser/omni.ja

rm /home/philipp/.cache/mozilla/firefox -r

