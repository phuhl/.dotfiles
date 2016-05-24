#!/bin/bash
os=$1
echo ''

install_keeweb () {
    mkdir /opt/keeweb
    cd /opt/keeweb
    rm /opt/keeweb/* -r
    wget https://github.com/antelle/keeweb/releases/download/v1.1.4/KeeWeb.linux.x64.zip -O /opt/keeweb/keeweb.zip
    unzip /opt/keeweb/keeweb.zip
    rm /opt/keeweb/keeweb.zip
    
    echo "#!/bin/bash" > /usr/local/bin/keeweb
    echo "/opt/keeweb/KeeWeb" >> /usr/local/bin/keeweb
}



if [ X"$os" = X"u" ]; then
    echo 'Installing keeweb for Ubuntu-like systems'
    echo ''
    sudo apt-get -qq wget unzip
    install_keeweb
fi
if [ X"$os" = X"a" ]; then
    echo 'Installing keeweb for Arch systems'
    echo ''
    sudo pacman -S unzip wget  --noconfirm --needed
    install_keeweb
fi



echo ''
