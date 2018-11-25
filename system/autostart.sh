sleep 5

export GDK_SCALE=2

cd /opt/resilio
./rslsync &
dropbox &
pulseaudio --start &
redshift-local &
linux-notification-center &
