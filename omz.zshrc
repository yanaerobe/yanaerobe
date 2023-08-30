export PATH=$PATH:$HOME/.local/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.yarn/bin:$HOME/gems/bin

# Gems
export GEM_HOME=$HOME/gems

plugins=(
  # lab
  aliases colored-man-pages command-not-found extract pyenv virtualenv emoji-clock rand-quote
  # built-ins
  git autojump ubuntu emoji python vscode timer themes vi-mode zsh-autosuggestions
  )
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="/etc/oh-my-zsh"
# export DISPLAY=192.41.124.231:0.0

# `echo $RANDOM_THEME` for theme name
ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=(
  # external themes
  # "windows" "saf"
  # built-ins
  "geoffgarside" "ys" "kafeitu" "fletcherm" "dieter" "agnoster" "juanghurtado" "af-magic" "Soliah" "steeef"
  )

# use case-sensitive completion.
# CASE_SENSITIVE="true"

# Auto-update behavior
zstyle ':omz:update' mode reminder

# Auto-update frequency (days)
zstyle ':omz:update' frequency 7

# thefuck
eval $(thefuck --alias)

# autojump path
[[ -s /home/yanj/.autojump/etc/profile.d/autojump.sh ]] && source /home/yanj/.autojump/etc/profile.d/autojump.sh

# autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use another custom folder than $ZSH/custom
ZSH_CUSTOM=~/.oh-my-zsh/custom

# Personal aliases
# For a full list of active aliases, run `alias`.
alias :q=exit
alias vim=nvim
alias cl=clear

source $ZSH/oh-my-zsh.sh

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
