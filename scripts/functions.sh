#!/usr/bin/env bash

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

warning () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

error () {
  printf "\r\033[2K  [\033[0;31mERROR\033[0m] $1\n"
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
