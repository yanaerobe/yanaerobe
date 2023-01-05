plugins=(git autojump ubuntu emoji python vscode timer themes vi-mode zsh-autosuggestions)
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# export DISPLAY=192.41.124.231:0.0

# `echo $RANDOM_THEME` for theme name
ZSH_THEME="random"
# ZSH_THEME_RANDOM_CANDIDATES=( "geoffgarside" "ys" "kafeitu" "fletcherm" "dieter" "agnoster" "juanghurtado" "af-magic" "Soliah")

# use case-sensitive completion.
# CASE_SENSITIVE="true"

# Auto-update behavior
zstyle ':omz:update' mode reminder

# Auto-update frequency (days)
zstyle ':omz:update' frequency 7

export PATH=$PATH:home/yjwin/.local/bin:$HOME/.config/yarn/global/node_modules/.bin:/$HOME/.yarn/bin

eval $(thefuck --alias)

[[ -s /home/yjwin/.autojump/etc/profile.d/autojump.sh ]] && source /home/yjwin/.autojump/etc/profile.d/autojump.sh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use another custom folder than $ZSH/custom
# ZSH_CUSTOM=/path/to/new-custom-folder

source $ZSH/oh-my-zsh.sh
bindkey '^ ' autosuggest-accept

# Personal aliases
# For a full list of active aliases, run `alias`.
alias :q=exit
alias vim=nvim

# Uncomment if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
