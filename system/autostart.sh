sleep 5

export GDK_SCALE=2

cd /opt/resilio
./rslsync &
# dropbox &
pulseaudio --start &
redshift-local &
date >> /home/philipp/.local/tmp/deadd-noti.log
deadd-notification-center >> /home/philipp/.local/tmp/deadd-noti.log 2>&1 &
