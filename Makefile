all: install-deps install-configs setup-services setup-mime-defaults
clean: turn-off-services clean-configs


install-deps: apt snap flatpak pyenv fzf script-bin
apt:
	sudo apt update
	xargs sudo apt install -y < ./deps/apt.txt
snap:
	xargs sudo snap install < ./deps/snap.txt
flatpak:
	xargs flatpak install --user -y flathub < ./deps/flathub.txt
pyenv:
	@if [ -d "$$HOME/.pyenv" ]; then \
		echo "pyenv is already installed at $$HOME/.pyenv"; \
	else \
		echo "Installing pyenv..."; \
		curl -fsSL https://pyenv.run | bash; \
	fi
fzf:
	@if [ ! -d "$$HOME/.fzf" ]; then \
		git clone --depth 1 https://github.com/junegunn/fzf.git $$HOME/.fzf && \
		$$HOME/.fzf/install --all; \
	else \
		echo "fzf already installed"; \
	fi
script-bin:
	stow -t ~/.local/bin script-bin


install-configs: dot-config x11 fonts resources 
x11:
	stow -t ~ X11
dot-config:
	stow -t ~/.config .config dot-profile
	stow -t ~ dot-profile
	./devbin/inject-dot-bashrc
fonts:
	stow -t ~/.local/share fonts
	fc-cache -f -v
resources:
	stow -t ~/.config resources


setup-services:
	sudo loginctl enable-linger $$USER
	systemctl --user daemon-reload
	systemctl --user enable picom.service

setup-mime-defaults:
	xdg-mime default org.pwmt.zathura.desktop application/pdf

turn-off-services:
	systemctl --user disable picom.service

clean-configs:
	stow --delete -t ~ X11
	stow --delete -t ~/.config .config dot-profile resources
	stow --delete -t ~ dot-profile
	stow --delete -t ~/.local/share fonts
	stow --delete -t ~/.local/bin script-bin
