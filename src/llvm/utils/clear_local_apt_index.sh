# shellcheck shell=bash

clear_local_apt_index() (
  set -e
  
  rm -rf /var/lib/apt/lists/*
  echo '🟩 Cleared local apt index'
)
