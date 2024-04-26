# PATH
export EDITOR='vim'
export SUDO_EDITOR='vim'

export DOTFILES=$HOME/.dotfiles
export WORKSPACE=$HOME/Workspace

export PATH="/usr/local/sbin:$PATH"
export PATH=$WORKSPACE:$PATH

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

# PLUGINS
source $HOMEBREW_PREFIX/opt/spaceship/spaceship.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.zsh/options.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# ALIASES
alias w="cd ~/Workspace"