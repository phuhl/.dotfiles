#!/bin/sh
os=$1
echo ''

mkdir ../../tor
mkdir ../../tor/downloads
chown $(stat -c '%U' ../../) ../../tor/downloads
chown $(stat -c '%U' ../../) ../../tor
cp updateTor.py ../../tor
cp updateTor /etc/cron.weekly
chmod 755 ../../tor/updateTor.py
chmod 744 /etc/cron.weekly

echo ''
