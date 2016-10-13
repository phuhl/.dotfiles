#!/bin/sh
os=$1
echo ''

echo 'Installing hosts-files'
echo ''


BASEDIR=$(dirname "$0")

cp $BASEDIR/hosts-anacron-monthly /etc/cron.monthly
chmod +x /etc/cron.monthly/hosts-anacron-monthly

mkdir /opt/hosts/
rm /opt/hosts/* -r
rm /opt/hosts/.* -r

git clone https://github.com/StevenBlack/hosts /opt/hosts
cp myhosts /opt/hosts/myhosts

cd /opt/hosts
python3 updateHostsFile.py --auto -f -r

echo ''
