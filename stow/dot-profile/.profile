# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Snap executable path
if [ -d /snap/bin/ ]; then
	PATH=$PATH:/snap/bin/
fi

export PYENV_ROOT="$HOME/.pyenv"
# Add pyenv executable to PATH if pyenv command is not already available
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# mason executable path
if [ -d ~/.local/share/nvim/mason/bin ]; then
	PATH="$PATH:~/.local/share/nvim/mason/bin/"
fi

export PATH

# zk
export ZK_NOTEBOOK_DIR="/mnt/vex9z7/the-vault/"
export TERMINAL="wezterm"
