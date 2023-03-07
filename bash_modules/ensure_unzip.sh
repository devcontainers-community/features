#!/bin/bash

ensure_unzip() (
  set -e

  if ! command -v unzip >/dev/null; then
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install -y unzip
    rm -rf /var/lib/apt/lists/*
  fi
)
