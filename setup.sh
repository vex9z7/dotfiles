#!/bin/bash

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

cd 
cd .config

for config  in $configs; do
	if [ -f "./$config" ]; then
		if [ "$config" == ".bashrc" ] || [ "$config" == ".profile" ]; then
			# make .bashrc source ./config/.bashrc
			# make .profile source ./config/.profile
			if ! [ -f "../$config" ]; then
				touch "../$config"
			fi

			cmd="source $(realpath $config)"

			if ! grep -q "$cmd" "../$config" ; then
				echo "$cmd" >> ../$config
			fi
		else
			# other configuration files
			rm -f ~/$config
			sudo ln -s $(realpath $config) ~/
		fi
	fi
done

# make soft link for picom
sudo mkdir -p /etc/xdg/.config
sudo rm -f /etc/xdg/.config/picom
sudo ln -s $(realpath picom) /etc/xdg/.config/

# bluetooth-autoconnect
cd bluetooth-autoconnect
sudo cp $(realpath bluetooth-autoconnect) /usr/local/bin/
sudo cp $(realpath bluetooth-autoconnect.service) /etc/systemd/system/
sudo systemctl enable bluetooth-autoconnect

