#!/bin/bash

# 4m root

BASE_DIR=$(dirname $(readlink -e $0))

apt-get install git -y

if [ -d /opt/studio ]; then
    rm -rf /opt/studio
fi
git clone https://github.com/dkorolev-hse/snowmix-studio.git /opt/studio
chown -R studio:staff /opt/studio
cd /opt/studio
install/2-install-4m-root.sh
