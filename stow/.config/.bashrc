# fzf
if type rg &>/dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore'
	export FZF_DEFAULT_OPTS='-m --bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'
fi

# preview
if type batcat &>/dev/null; then
	alias bat="batcat"
	export FZF_CTRL_T_OPTS='--style full --preview '\''fzf-preview.sh {}'\'''
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# vi mode
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# The fuck - ref. https://github.com/nvbn/thefuck.
eval "$(thefuck --alias)"
eval "$(thefuck --alias FUCK)"

# Load pyenv automatically by appending
eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# This is CCZE, a fast log colorizer written in C, intended to be a drop-in replacement for colorize
alias cc="ccze --mode=ansi"
alias ps="ps auxwf | ccze --mode=ansi"

# Credentials
if [ -d "$HOME/.credentials" ]; then
	for f in "$HOME/.credentials/"*; do
		source "$f"
	done
fi

# Restart your shell for the changes to take effect.
