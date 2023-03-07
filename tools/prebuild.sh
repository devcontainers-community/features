#!/bin/bash
# Copies the bash_modules/ folder to each src/* folder so that they can be
# sourced in the install.sh script.
set -e

for dir in src/*; do
  id=$(basename "$dir")
  if ! [[ -f "$dir/devcontainer-feature.json" ]]; then
    continue
  fi
  rsync -av bash_modules/ "src/$id/bash_modules/"
done
