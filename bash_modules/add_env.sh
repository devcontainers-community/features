#!/bin/bash

add_env() (
  set -e

  echo "export $1" >> /etc/bash.bashrc
  if [[ -f /etc/zsh/zshrc ]]; then
    echo "export $1" >> /etc/zsh/zshrc
  fi
)
