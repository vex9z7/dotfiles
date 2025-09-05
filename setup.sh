#!/bin/bash

DOTS_ROOT=$(pwd)

git submodule update --recursive

cd .config
configs=$(ls -A)

# create soft links to ~/.config
for config in $configs; do
	CONFIG_PATH=$(realpath $config)

	if [ -f "$CONFIG_PATH" ]; then
		rm -f ~/.config/$config
		ln -s $CONFIG_PATH ~/.config/
	fi

	if [ -d "$CONFIG_PATH" ]; then
		rm -rf ~/.config/$config
		ln -s $CONFIG_PATH ~/.config/
	fi
done

cd ~/.config

for config  in .bashrc .profile; do
    # source ./config/.bashrc in .bashrc
    # source ./config/.profile in .profile
    if ! [ -f "../$config" ]; then
      touch "../$config"
    fi

    cmd="source $(realpath $config)"

    if ! grep -q "$cmd" "../$config" ; then
      echo "$cmd" >> ../$config
    fi
done



# make soft link for picom
sudo rm -f /etc/xdg/picom.conf 
sudo ln -s $(realpath picom.conf) /etc/xdg


# make soft link for xrandr
sudo rm -f /etc/xdg/xrandr
sudo ln -s $(realpath xrandr) /etc/xdg

# go to dots root
cd $DOTS_ROOT

# bluetooth-autoconnect
cd bluetooth-autoconnect
sudo cp $(realpath bluetooth-autoconnect) /usr/local/bin/
sudo cp $(realpath bluetooth-autoconnect.service) /etc/systemd/system/
sudo systemctl enable bluetooth-autoconnect
# go to dots root
cd $DOTS_ROOT


# copy resources
cp -r resources $(realpath ~/.config)/
# copy fonts
cp -r fonts $(realpath ~/.local/share)/
