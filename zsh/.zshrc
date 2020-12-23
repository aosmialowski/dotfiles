# PATH
export EDITOR='vim'
export SUDO_EDITOR='vim'

export DOTFILES=$HOME/.dotfiles
export WORKSPACE=$HOME/Workspace

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH=$WORKSPACE:$PATH
export PATH=$HOME/bin:$PATH

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

source ~/.zsh/plugins.zsh
source ~/.zsh/options.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# ALIASES
alias w="cd ~/Workspace"
