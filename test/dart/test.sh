#!/bin/bash
set -e
source dev-container-features-test-lib

# Clean up
rm -rf /var/lib/apt/lists/*

apt_get_update() {
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

check_packages() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

check_packages git
LATEST_VERSION="$(git ls-remote --tags https://github.com/dart-lang/sdk | grep -oP "(?<=refs/tags)/[0-9]+\\.[0-9]+\\.[0-9]+$" | sort -V | tail -n 1)"

check 'dart' bash -c "dart --version | grep ${LATEST_VERSION}"

reportResults
