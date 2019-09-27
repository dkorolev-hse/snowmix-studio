#!/bin/bash

# 4m studio after snowmix

BASE_DIR=$(dirname $(readlink -e $0))

sudo apt-get install gstreamer1.0-alsa -y
sudo apt-get install alsa-utils -y
sudo apt-get install netcat -y
sudo apt-get install psmisc -y
sudo apt-get install bc -y

sudo /opt/studio/scripts/update-rules.sh

if [ -f /usr/local/bin/studio_start ]; then
    rm /usr/local/bin/studio_start
fi
if [ -f /usr/local/bin/studio_stop ]; then
    rm /usr/local/bin/studio_stop
fi
if [ -f /usr/local/bin/studio_midi ]; then
    rm /usr/local/bin/studio_midi
fi
sudo ln -s /opt/studio/scripts/studio_start /usr/local/bin/studio_start
sudo ln -s /opt/studio/scripts/studio_stop /usr/local/bin/studio_stop
sudo ln -s /opt/studio/scripts/studio_midi /usr/local/bin/studio_midi

$BASE_DIR/5-clean-4m-studio.sh
