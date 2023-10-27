# vim
## Build vim
### Clone vim Repo
```
git clone https://github.com/vim/vim.git
cd vim
```
### Install Dependencies
```
# tools to build vim
sudo apt install git
sudo apt install make
sudo apt install clang
sudo apt install libtool-bin
```
### Clean and test
```
cd src
# if you build Vim before
make distclean  

# run tests to check there are no problems
make test
```
### Configure and build
```
# add X windows clipboard support [Optional]
sudo apt install libxt-dev

# add Python 3 support [Optional]
sudo apt install libpython3-dev
# Uncomment the following line in Makefile
# "CONF_OPT_PYTHON = --enable-python3interp"

# apply configurations
make reconfig

# build
make
```
### Check the newly built vim
```
# see if the built vim has the features you want
./vim --version

# mess around with it see if it works
./vim
```
### Install to `/usr/local/bin`
```
sudo make install
```
### Set vim as the default editor
```
# add vim to the editor list
# run the following command in a new terminal, otherwise which vim would be resolved as the old vim
sudo update-alternatives --install /usr/bin/editor editor $(which vim) 50

# select vim as the default
selecct-editor
```

## vim related

### fzf
https://github.com/junegunn/fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### rg
https://github.com/BurntSushi/ripgrep#installation

# CLI tools
- zathura: pdf reader
- ncdu: disk usage analyzer
- ranger: file system broweser
- lazygit: git client
- aptitude

# i3
## Build & Installation
```
mkdir -p build && cd build

# configure build
meson ..
# install suggested dependecies carefully

# build
ninja

# check the i3 version after build
./i3 --version

# install to /usr/local/bin/i3
sudo ninja install
```
## Runtime Dependencies
 - xrandr
	-  change the layout in i3 setting `bash rito-dots/.config/xrandr/2vertical`
- picom
- xss-lock
- blueman
- terminator

### Inject Configurations
```
./setup.sh

sudo reboot
```

#  Fonts
https://medium.com/source-words/how-to-manually-install-update-and-uninstall-fonts-on-linux-a8d09a3853b0
## Install Fonts
```
mkdir ~/.local/share/fonts

# ..
# move your .ttf font files to fonts

# clear and regenerate font cache
fc-cache -f -v
```



# Peripheral related
##  bluetooth-autoconnect
### dependency
```
python3 -m pip install python-prctl dbus-python
sudo apt install bluez
```
### set up
-  run `blueman-applet` in daemon
- `blueman-manager` and connect keyboard
```
select auto connect profile 
```

# Apps
## apt apps
###
```
sudo apt install sxiv arandr
```
## flathub apps
https://flathub.org/setup
### alias flatpak softwares
https://www.reddit.com/r/pop_os/comments/mm74qb/assign_flatpak_run_orgchromiumchromium_to_an_alias/
### Syncthingy
```
flatpak install flathub com.github.zocker_160.SyncThingy
```
### chrome
```
flatpak install flathub com.google.Chrome
```
##### chrome-setting
- font size very large
- page zoom 200%
#### chrome-extensions
Custom New Tab URL
- https://chatgpt4google.com/
- https://github.com/brookhong/Surfingkeys
### obsidian
```
flatpak install flathub md.obsidian.Obsidian
```
### flameshot
```
flatpak install flathub org.flameshot.Flameshot
```
### peek
```
flatpak install flathub com.uploadedlobster.peek
```
### gimp
```
flatpak install flathub org.gimp.GIMP
```
### copyq
```
flatpak install flathub com.github.hluk.copyq
```
### vidcutter
```
flatpak install flathub com.ozmartians.VidCutter
```

## Home-made-scripts
### ocr
#### dependency
- tesseract
- flameshot
```
#!/bin/bash
flameshot gui --raw -s | tesseract - - | xclip -in -selection clipboard
```


# SAO color schema
- normal background #fbfbfb 
- normal foreground #4d4d4d
- selected background #eba601
- selected foreground #fbfbfb
