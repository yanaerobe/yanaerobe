export PATH=$PATH:$HOME/.local/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.yarn/bin:$HOME/gems/bin

# Gems
export GEM_HOME=$HOME/gems

plugins=(
  # lab
  pyenv rand-quote fancy-ctrl-z
  # built-ins
  aliases autojump colored-man-pages command-not-found extract emoji git python timer themes ubuntu vscode vi-mode virtualenv zsh-autosuggestions
  )

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
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

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="yyyy-mm-dd"

# thefuck
eval $(thefuck --alias)

# autojump path
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

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
alias :q  = exit
# alias vi  = nvim
alias vim = nvim
alias cl  = clear

source $ZSH/oh-my-zsh.sh

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
