#!/usr/bin/env bash

set -e
source dev-container-features-test-lib

LATEST_VERSION="$(git ls-remote --tags https://github.com/dart-lang/sdk | grep -oP "(?<=refs/tags/)3\\.[0-9]+\\.[0-9]+$" | sort -V | tail -n 1)"

check 'dart' bash -c "dart --version | grep ${LATEST_VERSION}"

reportResults
