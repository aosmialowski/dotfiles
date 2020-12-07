#!/usr/bin/env bash

COLOR_RESET="\033[0m"
COLOR_RED="\033[91m"
COLOR_GREEN="\033[92m"
COLOR_YELLOW="\033[93m"
COLOR_BLUE="\033[94m"
COLOR_MAGENTA="\033[95m"

debug () {
  printf "${COLOR_YELLOW}[ .. ] $1${COLOR_RESET}\n"
}

info () {
  printf "${COLOR_BLUE}[ .. ] $1${COLOR_RESET}\n"
}

success () {
  printf "${COLOR_GREEN}[ OK ] $1${COLOR_RESET}\n"
}

warning () {
  printf "${COLOR_MAGENTA}[ ?? ] $1${COLOR_RESET}\n"
}

error () {
  printf "${COLOR_RED}[ XX ] $1${COLOR_RESET}\n"
  echo ''
  exit
}

link () {
  args=("$@")

  file="${args[0]/\~\/}"
  source="$PWD/${args[1]}"
  force="${args[2]}"
  backup="$HOME/backup/$(date +%Y%m%d%H%M%S)"

  if [[ $force = true ]]; then
    if [[ -L $HOME/$file ]]; then
      info "removing existing link: $file"

      rm $HOME/$file

      success "removed existing link: $file"
    fi
  fi

  if [[ -f $HOME/$file ]]; then
    if [[ ! -L $HOME/$file ]]; then
      info "backing up file: $file"

      mkdir -p $backup/$(dirname $file)
      mv $HOME/$file $backup/$file

      success "backed up file: $file"
    fi
  fi

  if [[ ! -L $HOME/$file ]]; then
    info "creating link to $file"

    mkdir -p $HOME/$(dirname $file)
    ln -si $source $HOME/$file

    success "created link: $file"
  fi
}
