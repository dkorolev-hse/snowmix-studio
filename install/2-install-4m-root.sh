#!/bin/bash

# 4m root

BASE_DIR=$(dirname $(readlink -e $0))

echo "set 0 timeout to grub /etc/default/grub"
sed -i 's/.*GRUB_TIMEOUT.*/GRUB_TIMEOUT=0/' /etc/default/grub
update-grub

#echo "add repos"
echo "updating"
apt-get update; apt-get upgrade -y

apt-get install sudo -y
echo "add studio to sudo group /etc/group"
sed -i 's/.*sudo:x:27:.*/sudo:x:27:studio/' /etc/group

sudo apt-get install xorg -y
sudo apt-get install i3 -y
if [ ! -d /home/studio/.config ]; then
    mkdir /home/studio/.config
fi
if [ ! -d /home/studio/.config/i3 ]; then
    mkdir /home/studio/.config/i3
fi
echo "add i3 config .config/i3/config"
cp $BASE_DIR/../configs/i3.conf /home/studio/.config/i3/config
chown -R studio:studio /home/studio/.config
sudo apt-get install network-manager network-manager-gnome -y
sudo apt-get install gdm3 -y

echo "relogin as studio and choose i3wm in gdm3"
echo "then start $BASE_DIR/3-install-4m-studio-snowmix.sh as studio"
