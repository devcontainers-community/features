#!/bin/bash

ensure_curl() (
  set -e

  if ! command -v curl >/dev/null; then
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install -y curl ca-certificates
    rm -rf /var/lib/apt/lists/*
  fi
)
