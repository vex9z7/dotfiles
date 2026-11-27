# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------
# Basic shell behavior
# ------------------------------

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
setopt PROMPT_SUBST

HISTFILE="$HOME/.zsh_history"
HISTSIZE=20000
SAVEHIST=20000

# ------------------------------
# Completion
# ------------------------------

autoload -Uz compinit
compinit -C

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ------------------------------
# Vi mode
# ------------------------------

bindkey -v

# Use a beam cursor in insert mode and a block cursor in normal mode.
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne '\e[1 q'
  else
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

function zle-line-init {
  echo -ne '\e[5 q'
}
zle -N zle-line-init

# ------------------------------
# Aliases
# ------------------------------

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias cls='clear'

if command -v batcat >/dev/null 2>&1; then
  alias bat='batcat'
fi

if command -v fdfind >/dev/null 2>&1; then
  alias fd='fdfind'
fi

# ------------------------------
# Antidote plugins
# ------------------------------

# Antidote installation paths differ between installation path:
# Workaround: support both without changing their installations.
if [[ -f /usr/share/zsh-antidote/antidote.zsh ]]; then
  source /usr/share/zsh-antidote/antidote.zsh
elif [[ -f "$HOME/.antidote/antidote.zsh" ]]; then
  source "$HOME/.antidote/antidote.zsh"
else
  print -u2 "Warning: Antidote is not installed"
fi

source "$HOME/.zsh_plugins.zsh"
source ~/.zsh_plugins.zsh

# ------------------------------
# Keybindings
# ------------------------------

# Accept autosuggestion
bindkey '^y' autosuggest-accept

# Prefix-based history search
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Better up/down behavior: search history using current buffer prefix
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# ------------------------------
# FZF core behavior
# ------------------------------
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

export FZF_DEFAULT_OPTS='--height=45% --layout=reverse --border --inline-info --preview-window=right:60%:wrap'

if command -v fdfind >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fdfind --type d --hidden --follow --exclude .git'
else
  export FZF_DEFAULT_COMMAND='find . -type f 2>/dev/null'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='find . -type d 2>/dev/null'
fi

if command -v batcat >/dev/null 2>&1; then
  export FZF_CTRL_T_OPTS="--preview 'batcat --style=numbers --color=always --line-range=:200 {}'"
else
  export FZF_CTRL_T_OPTS="--preview 'sed -n 1,200p {}'"
fi

export FZF_CTRL_R_OPTS='--sort --exact'


# ------------------------------
# fzf-tab integration
# ------------------------------

zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always -la $realpath'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'batcat --style=numbers --color=always --line-range=:200 ${(Q)realpath} 2>/dev/null || sed -n "1,200p" ${(Q)realpath} 2>/dev/null || ls --color=always -la ${(Q)realpath}'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias nnvim="nvim --listen 0.0.0.0:16667"

# # fnm
# FNM_PATH="/home/vex9z7/.local/share/fnm"
# if [ -d "$FNM_PATH" ]; then
#   export PATH="$FNM_PATH:$PATH"
#   eval "$(fnm env --shell zsh)"
# fi

[[ ! -f "$HOME/.local/bin/env" ]] || source "$HOME/.local/bin/env"
if [[ -x "$HOME/.local/bin/mise" ]]; then eval "$("$HOME/.local/bin/mise" activate zsh)"; fi

# # Pi
# export PATH="/home/vex9z7/.local/share/fnm/node-versions/v24.16.0/installation/bin:$PATH"
