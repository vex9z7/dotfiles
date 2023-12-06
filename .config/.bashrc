# fzf
export FZF_DEFAULT_COMMAND='rg'

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore'
	export FZF_DEFAULT_OPTS='-m --bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# vi mode
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'


# The fuck - ref. https://github.com/nvbn/thefuck.
eval "$(thefuck --alias)"
eval "$(thefuck --alias FUCK)"


# Load pyenv automatically by appending
# the following to ~/.bash_profile if it exists, otherwise ~/.profile (for login shells) and ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

# eval "$(pyenv virtualenv-init -)"
