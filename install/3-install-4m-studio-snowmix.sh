#!/bin/bash

# 4m studio

BASE_DIR=$(dirname $(readlink -e $0))

echo "add studio to autologin /etc/gdm3/daemon.conf"
sudo sed -i 's/.*AutomaticLoginEnable.*/AutomaticLoginEnable\ =\ true/' /etc/gdm3/daemon.conf
sudo sed -i 's/.*AutomaticLogin\ =.*/AutomaticLogin\ =\ studio/' /etc/gdm3/daemon.conf
# to solve freezing with autologin
sudo apt-get install haveged -y
sudo systemctl enable haveged

sudo apt-get install vim -y
echo "add vim config .vimrc"
cp $BASE_DIR/../configs/vim.conf ~/.vimrc
sudo cp $BASE_DIR/../configs/vim.conf /root/.vimrc
sudo apt-get install xfce4-terminal -y
echo "add xfce4-terminal config .config/xfce4/terminal/terminalrc"
if [ ! -d ~/.config/xfce4 ]; then
    mkdir ~/.config/xfce4
fi
if [ ! -d ~/.config/xfce4/terminal ]; then
    mkdir ~/.config/xfce4/terminal
fi
cp $BASE_DIR/../configs/xfce4-terminal.conf ~/.config/xfce4/terminal/terminalrc

# install snowmix
sudo apt-get install wget -y
if [ ! -d /tmp/snowmix ]; then
    mkdir /tmp/snowmix
else
    rm -rf /tmp/snowmix/*
fi
wget https://sourceforge.net/projects/snowmix/files/Snowmix-0.5.1.tar.gz/download -O /tmp/snowmix/snowmix.tar.gz
cd /tmp/snowmix
tar -xvzf snowmix.tar.gz
sed -i 's/libpng12-dev/libpng-dev/g' /tmp/snowmix/Snowmix-0.5.1/bootstrapd/bootstrap-debian
cd Snowmix-0.5.1/
./bootstrap
echo "TODO next:"
echo "if u see upper \"Now please rerun the script bootstrap\":"
echo "  cd /tmp/snowmix/Snowmix-0.5.1/"
echo "  ./bootstrap"
echo "else"
echo "  cd /tmp/snowmix/Snowmix-0.5.1/"
echo "  make"
echo "  sudo make install"
echo "  then start $BASE_DIR/4-install-4m-studio-scripts.sh as studio"
echo "fi"
