#!/bin/sh
os=$1
echo ''

mkdir ../../tor
mkdir ../../tor/downloads
chown $(stat -c '%U' ../../) ../../tor/downloads
cp updateTor.py ../../tor
cp updateTor /etc/cron.weekly
chmod 744 /etc/cron.weekly

echo ''
