#!/bin/bash

# git submodule update --recursive

# bluetooth-autoconnect
cd bluetooth-autoconnect
sudo cp $(realpath bluetooth-autoconnect) /usr/local/bin/
sudo cp $(realpath bluetooth-autoconnect.service) /etc/systemd/system/

# enable systemd user services
sudo systemctl enable bluetooth-autoconnect
