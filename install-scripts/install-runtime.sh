sudo apt install dunst
sudo apt install suckless-tools
sudo apt install xss-lock
sudo apt install i3lock

sudo apt install blueman
sudo apt install i3status
sudo apt install fzf
sudo apt install playerctl
sudo apt install pulseaudio

sudo apt install autorandr
sudo apt install picom

sudo apt install peek

# copy q
flatpak install --user flathub com.github.hluk.copyq

# flameshot
flatpak install --user flathub org.flameshot.Flameshot

# pyenv
curl -fsSL https://pyenv.run | bash

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# rg
sudo apt install ripgrep
sudo apt install bat

# nvm
# Download and install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install 22
