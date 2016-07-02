#!/usr/bin/env bash

for dir in */; do
  dir=${dir%*/}
  stow ${dir##*/}
done
