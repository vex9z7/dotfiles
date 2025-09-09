# dotfiles

## Install & uninstall

```bash
# install and configure
make all
# uninstall configs
make clean
```

## i3

### Build & Installation

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

## bluetooth-autoconnect

### dependencies

```
python3 -m pip install python-prctl dbus-python
sudo apt install bluez
```

### set up

- run `blueman-applet` in daemon
- `blueman-manager` and connect keyboard
- select auto connect profile
